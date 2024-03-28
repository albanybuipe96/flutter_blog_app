import 'package:flutter_blog_app/src/auth/platform/data/models/user_model.dart';

abstract interface class AuthDataSource {
  Future<UserModel> signin({
    required String email,
    required String password,
  });

  Future<UserModel> signup({
    required String username,
    required String email,
    required String password,
  });
}
