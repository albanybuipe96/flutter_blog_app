import 'package:flutter_blog_app/core/errors/exceptions/server_exception.dart';
import 'package:flutter_blog_app/core/errors/failures/failure.dart';
import 'package:flutter_blog_app/src/auth/platform/data/sources/auth_data_source.dart';
import 'package:flutter_blog_app/src/auth/platform/domain/entities/user.dart';
import 'package:flutter_blog_app/src/auth/platform/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl with _GetUser implements AuthRepository {
  const AuthRepositoryImpl({required AuthDataSource dataSource})
      : _dataSource = dataSource;

  final AuthDataSource _dataSource;

  @override
  Future<Either<Failure, User>> signin({
    required String email,
    required String password,
  }) async {
    return makeRequest(
      () async => _dataSource.signin(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, User>> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    return makeRequest(
      () => _dataSource.signup(
        email: email,
        password: password,
        username: username,
      ),
    );
  }
}

mixin class _GetUser {
  Future<Either<Failure, User>> makeRequest(Future<User> Function() fn) async {
    try {
      final user = await fn();
      return right(user);
    } on ServerException catch (err) {
      return left(Failure(message: err.message));
    }
  }
}