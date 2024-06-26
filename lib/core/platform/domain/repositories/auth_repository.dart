import 'package:flutter_blog_app/core/errors/failures/failure.dart';
import 'package:flutter_blog_app/core/platform/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> get currentUser;

  Future<Either<Failure, User>> signin({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> signup({
    required String username,
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> signout();
}
