import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/global/base_use_case.dart';
import '../repositories/base_regular_authentication_repository.dart';

class SignUpUseCase extends BaseUseCase<Unit, UserEntity> {
  final BaseRegularAuthenticationRepository _repository;
  SignUpUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(UserEntity parameters) async {
    return await _repository.signUp(parameters);
  }
}
