import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../../../../core/network/failure.dart';
import '../entities/logged_in_user_entity.dart';
import '../../../../core/global/base_use_case.dart';
import '../repositories/base_regular_authentication_repository.dart';

class SocialSignUseCase extends BaseUseCase<LoggedInUserEntity, UserEntity> {
  final BaseRegularAuthenticationRepository repo;
  SocialSignUseCase(this.repo);

  @override
  Future<Either<Failure, LoggedInUserEntity>> call(
          UserEntity parameters) async =>
      await repo.socialSign(parameters);
}
