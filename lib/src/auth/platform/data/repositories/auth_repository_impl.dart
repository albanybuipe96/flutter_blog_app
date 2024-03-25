import 'package:flutter_blog_app/core/errors/exceptions/exception.dart';
import 'package:flutter_blog_app/core/errors/failures/failure.dart';
import 'package:flutter_blog_app/src/auth/platform/data/sources/auth_data_source.dart';
import 'package:flutter_blog_app/src/auth/platform/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({required AuthDataSource dataSource})
      : _dataSource = dataSource;

  final AuthDataSource _dataSource;

  @override
  Future<Either<Failure, String>> signin({
    required String email,
    required String password,
  }) async {
    try {
      final id = await _dataSource.signin(
        email: email,
        password: password,
      );

      return right(id);
    } on ServerException catch (err) {
      return left(Failure(message: err.message));
    }
  }

  @override
  Future<Either<Failure, String>> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final id = await _dataSource.signup(
        email: email,
        password: password,
        username: username,
      );

      return right(id);
    } on ServerException catch (err) {
      return left(Failure(message: err.message));
    }
  }
}
