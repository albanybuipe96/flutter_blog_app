import 'package:flutter_blog_app/core/errors/exceptions/server_exception.dart';
import 'package:flutter_blog_app/core/errors/failures/failure.dart';
import 'package:flutter_blog_app/core/platform/domain/repositories/auth_repository.dart';
import 'package:flutter_blog_app/core/platform/entities/user.dart';
import 'package:flutter_blog_app/src/auth/platform/data/sources/auth_data_source.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl with _GetUser implements AuthRepository {
  const AuthRepositoryImpl({required AuthDataSource dataSource})
      : _dataSource = dataSource;

  final AuthDataSource _dataSource;

  @override
  Future<Either<Failure, User>> get currentUser async {
    try {
      final user = await _dataSource.getCurrentUser;
      if (user == null) {
        return const Left(
          Failure(message: 'User not logged in.'),
        );
      }

      return Right(user);
    } on ServerException catch (err) {
      return Left(Failure(message: err.message));
    }
  }

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

  @override
  Future<Either<Failure, void>> signout() async {
    try {
      final response = await _dataSource.signout();
      return right(response);
    } on ServerException catch (err) {
      return left(Failure(message: err.message));
    }
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
