import 'package:oddo_hackathon_project/utils/import_export.dart';

class Db_Methods{
  final AppDatabase database = AppDatabase();

  //region User Methods
  Future<int> insertUser(User user) async {
    final db = await database.initDatabase();
    return await db.insert(TBL_USERS_NAME, user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<List<User>> getUsers() async {
    final db = await database.initDatabase();
    final List<Map<String, dynamic>> maps = await db.query(TBL_USERS_NAME);
    return List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
  }
  Future<int> updateUser(User user) async {
    final db = await database.initDatabase();
    return await db.update(
      TBL_USERS_NAME,
      user.toMap(),
      where: '$COL_USER_ID = ?',
      whereArgs: [user.userId],
    );
  }
  Future<int> deleteUser(int userId) async {
    final db = await database.initDatabase();
    return await db.delete(
      TBL_USERS_NAME,
      where: '$COL_USER_ID = ?',
      whereArgs: [userId],
    );
  }
  //endregion

  //region Skill Methods
  Future<int> insertSkill(Skill skill) async {
    final db = await database.initDatabase();
    return await db.insert(TBL_SKILLS_NAME, skill.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<List<Skill>> getSkills() async {
    final db = await database.initDatabase();
    final List<Map<String, dynamic>> maps = await db.query(TBL_SKILLS_NAME);
    return List.generate(maps.length, (i) {
      return Skill.fromMap(maps[i]);
    });
  }
  Future<int> updateSkill(Skill skill) async {
    final db = await database.initDatabase();
    return await db.update(
      TBL_SKILLS_NAME,
      skill.toMap(),
      where: '$COL_SKILL_ID = ?',
      whereArgs: [skill.skillId],
    );
  }
  Future<int> deleteSkill(int skillId) async {
    final db = await database.initDatabase();
    return await db.delete(
      TBL_SKILLS_NAME,
      where: '$COL_SKILL_ID = ?',
      whereArgs: [skillId],
    );
  }
  //endregion

  //region Swap Request Methods
  Future<void> sendSwapRequest({
    required int fromUserId,
    required int toUserId,
    required int offeredSkillId,
    required int requestedSkillId,
    String message = "", // Message can be added here if needed in future
  }) async {
    final swap = SwapRequest(
      fromUserId: fromUserId,
      toUserId: toUserId,
      offeredSkillId: offeredSkillId,
      requestedSkillId: requestedSkillId,
      status: "Pending", // Default status
    );
    await insertSwapRequest(swap);
  }

  Future<int> insertSwapRequest(SwapRequest swapRequest) async {
    final db = await database.initDatabase();
    return await db.insert(TBL_SWAP_REQUESTS_NAME, swapRequest.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<List<SwapRequest>> getSwapRequests() async {
    final db = await database.initDatabase();
    final List<Map<String, dynamic>> maps = await db.query(TBL_SWAP_REQUESTS_NAME);
    return List.generate(maps.length, (i) {
      return SwapRequest.fromMap(maps[i]);
    });
  }
  Future<int> updateSwapRequest(SwapRequest swapRequest) async {
    final db = await database.initDatabase();
    return await db.update(
      TBL_SWAP_REQUESTS_NAME,
      swapRequest.toMap(),
      where: '$COL_SWAP_ID = ?',
      whereArgs: [swapRequest.swapId],
    );
  }
//endregion
}