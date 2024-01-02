import 'package:dartz/dartz.dart';
import 'package:kak/core/global/base_use_case.dart';
import 'package:kak/core/network/failure.dart';
import 'package:kak/core/utils/enums.dart';

import '../repositories/base_caching_user_data_repository.dart';

class CacheAppLanguageUseCase extends BaseUseCase<Unit, DeviceLanguage> {
  final BaseCachingUserDataRepository cachingRepo;
  CacheAppLanguageUseCase(this.cachingRepo);

  @override
  Future<Either<Failure, Unit>> call(DeviceLanguage parameters) async =>
      await cachingRepo.cacheUserLanguage(parameters);
}
