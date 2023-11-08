import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../repositories/address_base_repo.dart';
import '../../../../core/global/base_use_case.dart';

class GetAddressUseCase extends BaseUseCase<String, LatLng> {
  final AddressBaseRepo repo;
  GetAddressUseCase(this.repo);

  @override
  Future<Either<Failure, String>> call(LatLng parameters) async =>
      await repo.getAddress(parameters);
}
