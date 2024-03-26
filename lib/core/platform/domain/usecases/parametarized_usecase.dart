import 'package:flutter_blog_app/core/errors/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ParametarizedUsecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}
