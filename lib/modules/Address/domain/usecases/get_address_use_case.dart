import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dartz/dartz.dart';

import '../entities/google_address.dart';
import '../../../../core/network/failure.dart';
import '../repositories/address_base_repo.dart';
import '../../../../core/global/base_use_case.dart';

class GetAddressUseCase extends BaseUseCase<GoogleAddressEntity, LatLng> {
  final AddressBaseRepo repo;
  GetAddressUseCase(this.repo);

  @override
  Future<Either<Failure, GoogleAddressEntity>> call(LatLng parameters) async =>
      await repo.getAddress(parameters);
}
