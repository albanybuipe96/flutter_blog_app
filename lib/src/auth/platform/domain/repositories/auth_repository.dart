import 'package:flutter_blog_app/core/errors/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signin({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> signup({
    required String username,
    required String email,
    required String password,
  });
}
