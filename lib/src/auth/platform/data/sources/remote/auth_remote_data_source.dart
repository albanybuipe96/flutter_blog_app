import 'dart:developer';

import 'package:flutter_blog_app/core/errors/exceptions/server_exception.dart';
import 'package:flutter_blog_app/core/resources/resources.dart';
import 'package:flutter_blog_app/src/auth/platform/data/models/user_model.dart';
import 'package:flutter_blog_app/src/auth/platform/data/sources/auth_data_source.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDataSource implements AuthDataSource {
  const AuthRemoteDataSource({required SupabaseClient client})
      : _client = client;

  final SupabaseClient _client;

  @override
  Future<UserModel> signin({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signInWithPassword(
        password: password,
        email: email,
      );

      if (response.user == null) {
        throw const ServerException(message: Strings.defaultErrorMessage);
      }

      return UserModel.fromJson(response.user!.toJson());
    } on AuthException catch (err) {
      throw ServerException(message: err.message);
    } catch (err) {
      throw ServerException(message: '$err');
    }
  }

  @override
  Future<UserModel> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signUp(
        password: password,
        email: email,
        data: {
          'username': username,
          'email': email,
        },
      );

      final user = response.user;
      if (user == null) {
        throw const ServerException(message: Strings.defaultErrorMessage);
      }

      log('${user}', name: '$runtimeType');

      return UserModel.fromJson(user.toJson());
    } on AuthException catch (err) {
      throw ServerException(
        message: err.message,
        statusCode: err.statusCode,
      );
    } catch (err) {
      rethrow;
    }
  }
}
