import 'package:oddo_hackathon_project/utils/import_export.dart';

class Db_Methods{
  AppDatabase _database=AppDatabase();
  //region table user methods
  Future<int> insertUser(User user) async {
    final db = await _database.initDatabase();
    return await db.insert(TBL_USERS_NAME, user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<List<User>> getUsers() async {
    final db = await _database.initDatabase();
    final List<Map<String, dynamic>> maps = await db.query(TBL_USERS_NAME);
    return List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
  }
  Future<int> updateUser(User user) async {
    final db = await _database.initDatabase();
    return await db.update(
      TBL_USERS_NAME,
      user.toMap(),
      where: '$COL_USER_ID = ?',
      whereArgs: [user.userId],
    );
  }

  Future<int> deleteUser(int userId) async {
    final db = await _database.initDatabase();
    return await db.delete(
      TBL_USERS_NAME,
      where: '$COL_USER_ID = ?',
      whereArgs: [userId],
    );
  }
  //endregion

  //region skill method
  Future<int> insertSkill(Skill skill) async {
    final db = await _database.initDatabase();
    return await db.insert(TBL_SKILLS_NAME, skill.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Skill>> getSkills() async {
    final db = await _database.initDatabase();
    final List<Map<String, dynamic>> maps = await db.query(TBL_SKILLS_NAME);
    return List.generate(maps.length, (i) {
      return Skill.fromMap(maps[i]);
    });
  }


  Future<int> updateSkill(Skill skill) async {
    final db = await _database.initDatabase();
    return await db.update(
      TBL_SKILLS_NAME,
      skill.toMap(),
      where: '$COL_SKILL_ID = ?',
      whereArgs: [skill.skillId],
    );
  }

  Future<int> deleteSkill(int skillId) async {
    final db = await _database.initDatabase();
    return await db.delete(
      TBL_SKILLS_NAME,
      where: '$COL_SKILL_ID = ?',
      whereArgs: [skillId],
    );
  }
//endregion

  //region table user skill offered methods

  Future<int> insertUserSkillOffered(UserSkillOffered userSkillOffered) async {
    final db = await _database.initDatabase();
    return await db.insert(TBL_USER_SKILLS_OFFERED_NAME, userSkillOffered.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<UserSkillOffered>> getUserSkillsOffered(int userId) async {
    final db = await _database.initDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      TBL_USER_SKILLS_OFFERED_NAME,
      where: '$COL_USER_SKILL_OFFERED_USER_ID = ?',
      whereArgs: [userId],
    );
    return List.generate(maps.length, (i) {
      return UserSkillOffered.fromMap(maps[i]);
    });
  }


  Future<int> deleteUserSkillOffered(int id) async {
    final db = await _database.initDatabase();
    return await db.delete(
      TBL_USER_SKILLS_OFFERED_NAME,
      where: '$ID = ?',
      whereArgs: [id],
    );
  }
//endregion

  // region table skill request methods
  Future<int> insertUserSkillRequested(UserSkillRequested userSkillRequested) async {
    final db = await _database.initDatabase();
    return await db.insert(TBL_USER_SKILLS_REQUESTED_NAME, userSkillRequested.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<UserSkillRequested>> getUserSkillsRequested(int userId) async {
    final db = await _database.initDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      TBL_USER_SKILLS_REQUESTED_NAME,
      where: '$COL_USER_SKILL_REQUESTED_USER_ID = ?',
      whereArgs: [userId],
    );
    return List.generate(maps.length, (i) {
      return UserSkillRequested.fromMap(maps[i]);
    });
  }

  Future<int> deleteUserSkillRequested(int id) async {
    final db = await _database.initDatabase();
    return await db.delete(
      TBL_USER_SKILLS_REQUESTED_NAME,
      where: '$ID = ?',
      whereArgs: [id],
    );
  }
//endregion
  // region table swap request

  Future<int> insertSwapRequest(SwapRequest swapRequest) async {
    final db = await _database.initDatabase();
    return await db.insert(TBL_SWAP_REQUESTS_NAME, swapRequest.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<SwapRequest>> getSwapRequests() async {
    final db = await _database.initDatabase();
    final List<Map<String, dynamic>> maps = await db.query(TBL_SWAP_REQUESTS_NAME);
    return List.generate(maps.length, (i) {
      return SwapRequest.fromMap(maps[i]);
    });
  }

  Future<SwapRequest?> getSwapRequestById(int swapId) async {
    final db = await _database.initDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      TBL_SWAP_REQUESTS_NAME,
      where: '$COL_SWAP_ID = ?',
      whereArgs: [swapId],
    );
    if (maps.isNotEmpty) {
      return SwapRequest.fromMap(maps.first);
    }
    return null;
  }

  Future<int> updateSwapRequest(SwapRequest swapRequest) async {
    final db = await _database.initDatabase();
    return await db.update(
      TBL_SWAP_REQUESTS_NAME,
      swapRequest.toMap(),
      where: '$COL_SWAP_ID = ?',
      whereArgs: [swapRequest.swapId],
    );
  }

  Future<int> deleteSwapRequest(int swapId) async {
    final db = await _database.initDatabase();
    return await db.delete(
      TBL_SWAP_REQUESTS_NAME,
      where: '$COL_SWAP_ID = ?',
      whereArgs: [swapId],
    );
  }
//end region
}