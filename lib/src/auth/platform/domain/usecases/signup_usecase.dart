import 'package:flutter_blog_app/core/errors/failures/failure.dart';
import 'package:flutter_blog_app/core/platform/domain/usecases/parametarized_usecase.dart';
import 'package:flutter_blog_app/src/auth/platform/domain/entities/user.dart';
import 'package:flutter_blog_app/src/auth/platform/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignupUseCase implements ParametarizedUsecase<User, SignupParams> {
  const SignupUseCase({required AuthRepository repository})
      : _repository = repository;
  final AuthRepository _repository;

  @override
  Future<Either<Failure, User>> call(SignupParams params) async {
    return _repository.signup(
      username: params.username,
      email: params.email,
      password: params.password,
    );
  }
}

class SignupParams {
  const SignupParams({
    required this.username,
    required this.email,
    required this.password,
  });

  factory SignupParams.empty() => const SignupParams(
        username: '',
        email: '',
        password: '',
      );

  final String username;
  final String email;
  final String password;

  SignupParams copyWith({
    String? username,
    String? email,
    String? password,
  }) {
    return SignupParams(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return 'SignupParams{username: $username, '
        'email: $email, password: $password}';
  }
}
