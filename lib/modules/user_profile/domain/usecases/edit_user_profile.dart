import 'package:dartz/dartz.dart';

import '../entities/user_profile.dart';
import '../../../../core/network/failure.dart';
import '../repositories/user_profile_base.dart';
import '../../../../core/global/base_use_case.dart';

class EditUserProfileUseCase extends BaseUseCase<Unit, UserProfileEntity>{
  final UserProfileBaseRepo repo;
  EditUserProfileUseCase(this.repo);

  @override
  Future<Either<Failure, Unit>> call(UserProfileEntity parameters) async => 
  await repo.editUserProfile(parameters);

}