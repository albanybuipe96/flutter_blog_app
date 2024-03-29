import 'package:flutter_blog_app/src/auth/platform/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

abstract interface class AuthDataSource {
  supabase.Session? get userSession;

  Future<UserModel> signin({
    required String email,
    required String password,
  });

  Future<UserModel> signup({
    required String username,
    required String email,
    required String password,
  });

  Future<void> signout();

  Future<UserModel?> get getCurrentUser;
}
