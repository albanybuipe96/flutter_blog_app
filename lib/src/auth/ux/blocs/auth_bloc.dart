import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog_app/src/auth/platform/domain/usecases/signup_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required SignupUseCase signupUseCase})
      : _signupUsecase = signupUseCase,
        super(AuthInitial()) {
    on<AuthSignup>(_onSignupEvent);
  }

  final SignupUseCase _signupUsecase;

  Future<void> _onSignupEvent(AuthSignup event, Emitter<AuthState> emit) async {
    final response = await _signupUsecase(
      SignupParams(
        username: event.username,
        email: event.email,
        password: event.password,
      ),
    );

    response.fold(
      (failure) => emit(AuthFailure(message: failure.message)),
      (uid) => emit(AuthSuccess(uid: uid)),
    );
  }
}
