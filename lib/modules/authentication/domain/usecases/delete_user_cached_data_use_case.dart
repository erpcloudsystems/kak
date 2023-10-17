import 'package:dartz/dartz.dart';
import '../../../../core/global/base_use_case.dart';
import '../../../../core/network/failure.dart';
import '../repositories/base_caching_user_data_repository.dart';

class DeleteUserCachedDataUseCase extends BaseUseCase<Unit, NoParameters> {
  final BaseCachingUserDataRepository _repository;

  DeleteUserCachedDataUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(NoParameters parameters) async {
    return await _repository.deleteUserCachedData();
  }
}
