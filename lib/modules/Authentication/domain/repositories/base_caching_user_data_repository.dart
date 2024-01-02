import 'package:dartz/dartz.dart';

import '../../../../core/utils/enums.dart';
import '../../../../core/network/failure.dart';
import '../entities/user_caching_data_entity.dart';

abstract class BaseCachingUserDataRepository {
  Future<Either<Failure, Unit>> cacheUserLanguage(DeviceLanguage language);
  Future<Either<Failure, Unit>> cacheUser(UserCachingDataEntity userData);
  Future<Either<Failure, DeviceLanguage>> getCachedUserLanguage();
  Future<Either<Failure, UserCachingDataEntity>> getCacheUser();
  Future<Either<Failure, Unit>> deleteUserCachedData();
}
