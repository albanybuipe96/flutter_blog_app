import 'dart:async';

import 'package:flutter_blog_app/env/secrets.dart';
import 'package:flutter_blog_app/src/auth/platform/data/repositories/auth_repository_impl.dart';
import 'package:flutter_blog_app/src/auth/platform/data/sources/auth_data_source.dart';
import 'package:flutter_blog_app/src/auth/platform/data/sources/remote/auth_remote_data_source.dart';
import 'package:flutter_blog_app/src/auth/platform/domain/repositories/auth_repository.dart';
import 'package:flutter_blog_app/src/auth/platform/domain/usecases/signup_usecase.dart';
import 'package:flutter_blog_app/src/auth/ux/screens/signup/signup_screen_state.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

class Di {
  const Di._();

  static Future<void> init() async {
    await _injector();
    await _injectSignupState();
  }

  static Future<Supabase> initSupabase() async {
    return Supabase.initialize(
      url: Secrets.SUPABASE_URL,
      anonKey: Secrets.SUPABASE_ANON_KEY,
    );
  }

  static Future<void> _injector() async {
    final client = (await Di.initSupabase()).client;
    serviceLocator
      ..registerFactory(
        () => SignupScreenState(
          useCase: SignupUseCase(
            repository: serviceLocator(),
          ),
        ),
      )
      ..registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
          dataSource: serviceLocator(),
        ),
      )
      ..registerLazySingleton<AuthDataSource>(
        () => AuthRemoteDataSource(
          client: serviceLocator(),
        ),
      )
      ..registerLazySingleton<SupabaseClient>(
        () => client,
      );
  }

  static Future<void> _injectSignupState() async {
    Get.lazyPut(
          () => SignupScreenState(
        useCase: SignupUseCase(
          repository: AuthRepositoryImpl(
            dataSource: AuthRemoteDataSource(
              client: serviceLocator(),
            ),
          ),
        ),
      ),
    );
  }
}
