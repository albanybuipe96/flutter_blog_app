import 'dart:async';

import 'package:flutter_blog_app/core/common/auth/current_user_state.dart';
import 'package:flutter_blog_app/core/platform/domain/repositories/auth_repository.dart';
import 'package:flutter_blog_app/core/platform/domain/usecases/current_user_usecase.dart';
import 'package:flutter_blog_app/core/platform/domain/usecases/signout_usecase.dart';
import 'package:flutter_blog_app/env/secrets.dart';
import 'package:flutter_blog_app/src/auth/platform/data/repositories/auth_repository_impl.dart';
import 'package:flutter_blog_app/src/auth/platform/data/sources/auth_data_source.dart';
import 'package:flutter_blog_app/src/auth/platform/data/sources/remote/auth_remote_data_source.dart';
import 'package:flutter_blog_app/src/auth/platform/domain/usecases/signin_usecase.dart';
import 'package:flutter_blog_app/src/auth/platform/domain/usecases/signup_usecase.dart';
import 'package:flutter_blog_app/src/auth/ux/screens/signin/signin_screen_state.dart';
import 'package:flutter_blog_app/src/auth/ux/screens/signup/signup_screen_state.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

class Di {
  const Di._();

  static Future<void> init() async {
    await _injector();
  }

  static Future<Supabase> _initSupabase() async {
    return Supabase.initialize(
      url: Secrets.SUPABASE_URL,
      anonKey: Secrets.SUPABASE_ANON_KEY,
    );
  }

  static Future<void> _injector() async {
    await _injectDataSources();
    _injectRepositories();
    _injectUsecases();
  }

  static void injectSignupScreenState() {
    Get.lazyPut(() => SignupScreenState(signupUsecase: serviceLocator()));
  }

  static void injectSigninScreenState() {
    Get.lazyPut(() => SigninScreenState(signinUsecase: serviceLocator()));
  }

  static void injectCurrentUserState() {
    Get.lazyPut(
      () => CurrentUserState(
        currentUserUsecase: serviceLocator(),
        signoutUsecase: serviceLocator(),
      ),
    );
  }

  static void _injectUsecases() {
    serviceLocator
      ..registerFactory(() => SignupUsecase(repository: serviceLocator()))
      ..registerFactory(() => SigninUsecase(repository: serviceLocator()))
      ..registerFactory(() => CurrentUserUsecase(repository: serviceLocator()))
      ..registerFactory(() => SignoutUsecase(repository: serviceLocator()));
  }

  static void _injectRepositories() {
    serviceLocator.registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(dataSource: serviceLocator()),
    );
  }

  static Future<void> _injectDataSources() async {
    final client = (await Di._initSupabase()).client;
    serviceLocator
      ..registerFactory<AuthDataSource>(
        () => AuthRemoteDataSource(client: serviceLocator()),
      )
      ..registerFactory<SupabaseClient>(() => client);
  }
}
