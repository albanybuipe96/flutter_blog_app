import 'package:flutter_blog_app/src/auth/platform/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.email,
    required super.username,
  });

  factory UserModel.fromJson(Map<String, dynamic>? json) {
    return UserModel(
      id: json?['id'] as String?,
      email: json?['email'] as String?,
      username: json?['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
    };
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? username,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
    );
  }

  @override
  String toString() {
    return 'UserModel{id: $id, username: $username, email: $email}';
  }
}
