import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../entities/user_caching_data_entity.dart';
import '../../../../core/global/base_use_case.dart';
import '../repositories/base_caching_user_data_repository.dart';

class CacheUserUseCase extends BaseUseCase<Unit, UserCachingDataEntity> {
  final BaseCachingUserDataRepository _repository;
  CacheUserUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(UserCachingDataEntity parameters) async =>
      await _repository.cacheUser(parameters);
}
