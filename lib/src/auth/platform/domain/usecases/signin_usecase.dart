import 'package:flutter_blog_app/core/errors/failures/failure.dart';
import 'package:flutter_blog_app/core/platform/domain/repositories/auth_repository.dart';
import 'package:flutter_blog_app/core/platform/domain/usecases/parametarized_usecase.dart';
import 'package:flutter_blog_app/core/platform/entities/user.dart';
import 'package:fpdart/fpdart.dart';

class SigninUsecase implements ParametarizedUsecase<User, SigninParams> {
  const SigninUsecase({required AuthRepository repository})
      : _repository = repository;
  final AuthRepository _repository;

  @override
  Future<Either<Failure, User>> call(SigninParams params) {
    return _repository.signin(
      email: params.email,
      password: params.password,
    );
  }
}

class SigninParams {
  const SigninParams({
    required this.email,
    required this.password,
  });

  factory SigninParams.empty() => const SigninParams(email: '', password: '');

  final String email;
  final String password;

  SigninParams copyWith({
    String? email,
    String? password,
  }) {
    return SigninParams(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return 'SigninParams{email: $email, password: $password}';
  }
}
