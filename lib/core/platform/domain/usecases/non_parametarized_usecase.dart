import 'package:flutter_blog_app/core/errors/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class NonParametarizedUsecase<SuccessType> {
  Future<Either<Failure, SuccessType>> call();
}
