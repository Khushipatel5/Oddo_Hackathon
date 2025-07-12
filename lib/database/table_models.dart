import 'package:oddo_hackathon_project/utils/import_export.dart';
class User {
  int? userId;
  String name;
  String email;
  String? bio;
  String? imageUrl;
  String? location;
  String? password;
  String? isPublic;


  User({
    this.userId,
    required this.name,
    required this.email,
    this.bio,
    this.imageUrl,
    this.location,
    this.password,
    this.isPublic
  });

  // Convert a User object into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      COL_USER_ID: userId,
      COL_USER_NAME: name,
      COL_USER_EMAIL: email,
      COL_USER_BIO: bio,
      COL_USER_IMAGE_URL: imageUrl,
      COL_USER_LOCATION: location,
      COL_USER_PASSWORD: password,
      COL_USER_IS_PUBLIC: isPublic,
    };
  }


  // Convert a Map into a User object.
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map[COL_USER_ID],
      name: map[COL_USER_NAME],
      email: map[COL_USER_EMAIL],
      bio: map[COL_USER_BIO],
      imageUrl: map[COL_USER_IMAGE_URL],
      location: map[COL_USER_LOCATION],
      password: map[COL_USER_PASSWORD],
      isPublic: map[COL_USER_IS_PUBLIC]?.toString(),
    );
  }


  @override
  String toString() {
    return 'User{userId: $userId, name: $name, email: $email, bio: $bio, photoUrl: $imageUrl}';
  }
}

/// Represents a row in the 'skills' table.
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
      COL_SKILL_ID: skillId,
      COL_SKILL_NAME: name,
      COL_SKILL_CATAGORY: category,
    };
  }

  factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      skillId: map[COL_SKILL_ID],
      name: map[COL_SKILL_NAME],
      category: map[COL_SKILL_CATAGORY],
    );
  }

  @override
  String toString() {
    return 'Skill{skillId: $skillId, name: $name, category: $category}';
  }
}

/// Represents a row in the 'user_skills_offered' table.
class UserSkillOffered {
  int? id;
  int userId;
  int skillId;
  String? description;
  // Note: 'level' field removed as per database schema

  UserSkillOffered({
    this.id,
    required this.userId,
    required this.skillId,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      ID: id,
      COL_USER_SKILL_OFFERED_USER_ID: userId,
      COL_USER_SKILL_OFFERED_ID: skillId,
      COL_USER_SKILL_OFFERED_DESCRIPTION: description,
    };
  }

  factory UserSkillOffered.fromMap(Map<String, dynamic> map) {
    return UserSkillOffered(
      id: map[ID],
      userId: map[COL_USER_SKILL_OFFERED_USER_ID],
      skillId: map[COL_USER_SKILL_OFFERED_ID],
      description: map[COL_USER_SKILL_OFFERED_DESCRIPTION],
    );
  }

  @override
  String toString() {
    return 'UserSkillOffered{id: $id, userId: $userId, skillId: $skillId, description: $description}';
  }
}

/// Represents a row in the 'user_skills_requested' table.
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
      ID: id,
      COL_USER_SKILL_REQUESTED_USER_ID: userId,
      COL_USER_SKILL_REQUESTED_ID: skillId,
    };
  }

  factory UserSkillRequested.fromMap(Map<String, dynamic> map) {
    return UserSkillRequested(
      id: map[ID],
      userId: map[COL_USER_SKILL_REQUESTED_USER_ID],
      skillId: map[COL_USER_SKILL_REQUESTED_ID],
    );
  }

  @override
  String toString() {
    return 'UserSkillRequested{id: $id, userId: $userId, skillId: $skillId}';
  }
}

/// Represents a row in the 'swap_requests' table.
class SwapRequest {
  int? swapId;
  int fromUserId;
  int toUserId;
  int offeredSkillId;
  int requestedSkillId;
  String status;
  // Note: 'message' and 'createdAt' fields removed as per database schema

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
      COL_SWAP_ID: swapId,
      COL_FROM_USER_ID: fromUserId,
      COL_TO_USER_ID: toUserId,
      COL_OFFERED_SKILL_ID: offeredSkillId,
      COL_REQUESTED_SKILL_ID: requestedSkillId,
      COL_STATUS: status,
    };
  }

  factory SwapRequest.fromMap(Map<String, dynamic> map) {
    return SwapRequest(
      swapId: map[COL_SWAP_ID],
      fromUserId: map[COL_FROM_USER_ID],
      toUserId: map[COL_TO_USER_ID],
      offeredSkillId: map[COL_OFFERED_SKILL_ID],
      requestedSkillId: map[COL_REQUESTED_SKILL_ID],
      status: map[COL_STATUS],
    );
  }

  @override
  String toString() {
    return 'SwapRequest{swapId: $swapId, fromUserId: $fromUserId, toUserId: $toUserId, offeredSkillId: $offeredSkillId, requestedSkillId: $requestedSkillId, status: $status}';
  }
}