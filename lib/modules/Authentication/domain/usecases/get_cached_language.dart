import 'package:dartz/dartz.dart';

import '../../../../core/utils/enums.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/global/base_use_case.dart';
import '../repositories/base_caching_user_data_repository.dart';

class GetCachedLanguageUseCase extends BaseUseCase<DeviceLanguage, NoParameters>{
  final BaseCachingUserDataRepository repo;

  GetCachedLanguageUseCase(this.repo);
  
  @override
  Future<Either<Failure, DeviceLanguage>> call(NoParameters parameters) async =>
  await repo.getCachedUserLanguage();

}