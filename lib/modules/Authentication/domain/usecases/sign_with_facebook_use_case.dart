import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/global/base_use_case.dart';
import '../repositories/base_social_sign_repository.dart';

class SignWithFacebookUseCase extends BaseUseCase<UserEntity, NoParameters> {
  final BaseSocialSignRepository _repository;
  SignWithFacebookUseCase(this._repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParameters parameters) async {
    return await _repository.signWithFacebook();
  }
}
