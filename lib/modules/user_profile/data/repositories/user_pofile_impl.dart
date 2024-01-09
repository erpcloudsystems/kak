import 'package:dartz/dartz.dart';
import 'package:kak/modules/user_profile/data/models/user_profile.dart';

import '../datasources/user_profile.dart';
import '../../../../core/network/failure.dart';
import '../../domain/entities/user_profile.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/user_profile_base.dart';
import '../../../../core/network/helper_network_methods.dart';

class UserProfileRepoImpl implements UserProfileBaseRepo {
  final UserProfileBaseDataSource dataSource;
  final BaseNetworkInfo networkInfo;

  const UserProfileRepoImpl(this.dataSource, this.networkInfo);

  // Get user profile _______________________________________________________
  @override
  Future<Either<Failure, UserProfileEntity>> getUserProfile() async =>
      await HelperNetworkMethods.commonApiResponseMethod<UserProfileEntity>(
          () async => await dataSource.getUserProfile(), networkInfo);

  // Edit user profile _______________________________________________________
  @override
  Future<Either<Failure, Unit>> editUserProfile(UserProfileEntity user) async {
    final userModel = UserProfileModel(
      mobileNo: user.mobileNo,
      address: user.address,
      email: user.email,
      image: user.image,
      name: user.name,
    );
    return await HelperNetworkMethods.commonApiResponseMethod<Unit>(
      () async => await dataSource.editUserProfile(userModel),
      networkInfo,
    );
  }
}
