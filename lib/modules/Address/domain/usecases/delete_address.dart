import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../repositories/address_base_repo.dart';
import '../../../../core/global/base_use_case.dart';

class DeleteAddressUseCase extends BaseUseCase<Unit, String> {
  final AddressBaseRepo repo;
  DeleteAddressUseCase(this.repo);

  @override
  Future<Either<Failure, Unit>> call(String parameters) async =>
      await repo.deleteAddress(parameters);
}
