import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/global/base_use_case.dart';
import '../../../authentication/domain/entities/logged_in_user_entity.dart';
import '../../../authentication/domain/entities/user.dart';
import '../repositories/base_regular_authentication_repository.dart';

class SignInUseCase extends BaseUseCase<LoggedInUserEntity, UserEntity> {
  final BaseRegularAuthenticationRepository _repository;

  SignInUseCase(this._repository);

  @override
  Future<Either<Failure, LoggedInUserEntity>> call(UserEntity parameters) async {
    return await _repository.signIn(parameters);
  }
}
