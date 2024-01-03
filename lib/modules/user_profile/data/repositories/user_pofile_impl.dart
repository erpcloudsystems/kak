import 'package:dartz/dartz.dart';

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

  @override
  Future<Either<Failure, UserProfileEntity>> getUserProfile() async =>
      await HelperNetworkMethods.commonApiResponseMethod<UserProfileEntity>(
          () async => await dataSource.getUserProfile(), networkInfo);
}
