import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog_app/src/auth/platform/data/models/user_model.dart';
import 'package:flutter_blog_app/src/auth/platform/domain/entities/user.dart';
import 'package:flutter_blog_app/src/auth/platform/domain/usecases/signin_usecase.dart';
import 'package:flutter_blog_app/src/auth/platform/domain/usecases/signup_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required SignupUseCase signupUseCase,
    required SigninUsecase signinUseCase,
  })  : _signupUsecase = signupUseCase,
        _signinUsecase = signinUseCase,
        super(AuthInitial()) {
    on<AuthSignup>(_onSignupEvent);
    on<AuthSignin>(_onSigninEvent);
  }

  final SignupUseCase _signupUsecase;
  final SigninUsecase _signinUsecase;

  Future<void> _onSignupEvent(
    AuthSignup event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final response = await _signupUsecase(
      SignupParams(
        username: event.username,
        email: event.email,
        password: event.password,
      ),
    );

    response.fold(
      (failure) {
        log(failure.message, name: '$runtimeType');
        emit(AuthFailure(message: failure.message));
      },
      (user) {
        log('${user.email}', name: '$runtimeType');
        emit(
          AuthSuccess(
            user: user,
          ),
        );
      },
    );
  }

  Future<void> _onSigninEvent(
    AuthSignin event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final response = await _signinUsecase(
      SigninParams(
        email: event.email,
        password: event.password,
      ),
    );

    response.fold(
      (failure) {
        log(failure.message, name: '$runtimeType');
        emit(AuthFailure(message: failure.message));
      },
      (user) {
        log('${user.email}', name: '$runtimeType');
        emit(
          AuthSuccess(
            user: user,
          ),
        );
      },
    );
  }
}
