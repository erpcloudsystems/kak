import 'package:dartz/dartz.dart';

import '../entities/address.dart';
import '../../../../core/network/failure.dart';
import '../repositories/address_base_repo.dart';
import '../../../../core/global/base_use_case.dart';

class GetAllAddressesUseCase
    extends BaseUseCase<List<AddressEntity>, NoParameters> {
  final AddressBaseRepo repo;
  GetAllAddressesUseCase(this.repo);

  @override
  Future<Either<Failure, List<AddressEntity>>> call(
          NoParameters parameters) async =>
      await repo.getAllAddresses();
}
