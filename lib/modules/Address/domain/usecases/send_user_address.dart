import 'package:dartz/dartz.dart';

import '../entities/address.dart';
import '../../../../core/network/failure.dart';
import '../repositories/address_base_repo.dart';
import '../../../../core/global/base_use_case.dart';

class SendUserAddressUseCase extends BaseUseCase<String, AddressEntity> {
  final AddressBaseRepo repo;
  SendUserAddressUseCase(this.repo);

  @override
  Future<Either<Failure, String>> call(AddressEntity parameters) async =>
      await repo.sendUserAddress(parameters);
}
