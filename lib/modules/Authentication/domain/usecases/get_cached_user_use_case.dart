import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../entities/user_caching_data_entity.dart';
import '../../../../core/global/base_use_case.dart';
import '../repositories/base_caching_user_data_repository.dart';

class GetCachedUserUseCase
    extends BaseUseCase<UserCachingDataEntity, NoParameters> {
  final BaseCachingUserDataRepository _repository;
  GetCachedUserUseCase(this._repository);

  @override
  Future<Either<Failure, UserCachingDataEntity>> call(
          NoParameters parameters) async =>
      await _repository.getCacheUser();
}
