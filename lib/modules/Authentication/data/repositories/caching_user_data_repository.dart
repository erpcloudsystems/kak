import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/network/exceptions.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../domain/entities/user_caching_data_entity.dart';
import '../datasources/authentication_local_data_source.dart';
import '../../domain/repositories/base_caching_user_data_repository.dart';

class CachingUserDataRepository implements BaseCachingUserDataRepository {
  final BaseLocalDataSource _localDataSource;

  const CachingUserDataRepository(this._localDataSource);

  //__________________________________Cache user email__________________________________
  @override
  Future<Either<Failure, Unit>> cacheUser(
      UserCachingDataEntity userData) async {
    try {
      await _localDataSource.cacheUser(userData);
      return const Right(unit);
    } catch (error) {
      return const Left(
        UnknownCachingFailure(
          errorMessage: StringsManager.unknownCachingFailureMessage,
        ),
      );
    }
  }

  //__________________________________Get Cached user email________________________________
  @override
  Future<Either<Failure, UserCachingDataEntity>> getCacheUser() async {
    try {
      final userData = await _localDataSource.getCachedUser();
      return Right(userData);
    } on EmptyCacheException {
      return const Left(
        EmptyCacheFailure(
          errorMessage: StringsManager.emptyCacheFailureMessage,
        ),
      );
    }
  }

  //______________________________Delete cached user data________________________________
  @override
  Future<Either<Failure, Unit>> deleteUserCachedData() async {
    try {
      await _localDataSource.deleteUserCachedData();
      return const Right(unit);
    } on EmptyCacheException {
      return const Left(EmptyCacheFailure(
        errorMessage: StringsManager.emptyCacheFailureMessage,
      ));
    }
  }
}
