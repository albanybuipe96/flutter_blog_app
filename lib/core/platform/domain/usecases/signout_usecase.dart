import 'package:flutter_blog_app/core/errors/failures/failure.dart';
import 'package:flutter_blog_app/core/platform/domain/repositories/auth_repository.dart';
import 'package:flutter_blog_app/core/platform/domain/usecases/non_parametarized_usecase.dart';
import 'package:fpdart/fpdart.dart';

class SignoutUsecase implements NonParametarizedUsecase<void> {
  const SignoutUsecase({required AuthRepository repository})
      : _repository = repository;
  final AuthRepository _repository;

  @override
  Future<Either<Failure, void>> call() => _repository.signout();
}
