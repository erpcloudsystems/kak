import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/global/base_use_case.dart';
import '../repositories/base_regular_authentication_repository.dart';

class DeleteAccountUseCase extends BaseUseCase<Unit, String> {
  final BaseRegularAuthenticationRepository repo;
  DeleteAccountUseCase(this.repo);

  @override
  Future<Either<Failure, Unit>> call(String parameters) async =>
  await repo.deleteAccount(parameters);
}