import 'package:dartz/dartz.dart';

import '../entities/user_profile.dart';
import '../../../../core/network/failure.dart';
import '../repositories/user_profile_base.dart';
import '../../../../core/global/base_use_case.dart';

class GetUserProfileUseCase
    extends BaseUseCase<UserProfileEntity, NoParameters> {
  final UserProfileBaseRepo repo;
  GetUserProfileUseCase(this.repo);

  @override
  Future<Either<Failure, UserProfileEntity>> call(
          NoParameters parameters) async =>
      await repo.getUserProfile();
}
