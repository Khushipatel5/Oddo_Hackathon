//model of user table
class User {
  int? userId;
  String name;
  String email;
  String? bio;
  String? photoUrl;

  User({
    this.userId,
    required this.name,
    required this.email,
    this.bio,
    this.photoUrl,
  });

  // Convert a User object into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'name': name,
      'email': email,
      'bio': bio,
      'photo_url': photoUrl,
    };
  }

  // Convert a Map into a User object.
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['user_id'],
      name: map['name'],
      email: map['email'],
      bio: map['bio'],
      photoUrl: map['photo_url'],
    );
  }

  @override
  String toString() {
    return 'User{userId: $userId, name: $name, email: $email, bio: $bio, photoUrl: $photoUrl}';
  }
}

//model for skill table
class Skill {
  int? skillId;
  String name;
  String category;

  Skill({
    this.skillId,
    required this.name,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'skill_id': skillId,
      'name': name,
      'category': category,
    };
  }

  factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      skillId: map['skill_id'],
      name: map['name'],
      category: map['category'],
    );
  }

  @override
  String toString() {
    return 'Skill{skillId: $skillId, name: $name, category: $category}';
  }
}

// model for userSkill offered
class UserSkillOffered {
  int? id;
  int userId;
  int skillId;
  String? description;
  String? level;

  UserSkillOffered({
    this.id,
    required this.userId,
    required this.skillId,
    this.description,
    this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'skill_id': skillId,
      'description': description,
      'level': level,
    };
  }

  factory UserSkillOffered.fromMap(Map<String, dynamic> map) {
    return UserSkillOffered(
      id: map['id'],
      userId: map['user_id'],
      skillId: map['skill_id'],
      description: map['description'],
      level: map['level'],
    );
  }

  @override
  String toString() {
    return 'UserSkillOffered{id: $id, userId: $userId, skillId: $skillId, description: $description, level: $level}';
  }
}

//model for userskill request
class UserSkillRequested {
  int? id;
  int userId;
  int skillId;

  UserSkillRequested({
    this.id,
    required this.userId,
    required this.skillId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'skill_id': skillId,
    };
  }

  factory UserSkillRequested.fromMap(Map<String, dynamic> map) {
    return UserSkillRequested(
      id: map['id'],
      userId: map['user_id'],
      skillId: map['skill_id'],
    );
  }

  @override
  String toString() {
    return 'UserSkillRequested{id: $id, userId: $userId, skillId: $skillId}';
  }
}

//model for swap request
class SwapRequest {
  int? swapId;
  int fromUserId;
  int toUserId;
  int offeredSkillId;
  int requestedSkillId;
  String status;


  SwapRequest({
    this.swapId,
    required this.fromUserId,
    required this.toUserId,
    required this.offeredSkillId,
    required this.requestedSkillId,
    required this.status,

  });

  Map<String, dynamic> toMap() {
    return {
      'swap_id': swapId,
      'from_user_id': fromUserId,
      'to_user_id': toUserId,
      'offered_skill_id': offeredSkillId,
      'requested_skill_id': requestedSkillId,
      'status': status,

    };
  }

  factory SwapRequest.fromMap(Map<String, dynamic> map) {
    return SwapRequest(
      swapId: map['swap_id'],
      fromUserId: map['from_user_id'],
      toUserId: map['to_user_id'],
      offeredSkillId: map['offered_skill_id'],
      requestedSkillId: map['requested_skill_id'],
      status: map['status'],
    );
  }

  @override
  String toString() {
    return 'SwapRequest{swapId: $swapId, fromUserId: $fromUserId, toUserId: $toUserId, offeredSkillId: $offeredSkillId, requestedSkillId: $requestedSkillId, status: $status}';
  }
}

