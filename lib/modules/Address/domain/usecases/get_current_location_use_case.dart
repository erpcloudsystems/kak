import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../repositories/address_base_repo.dart';
import '../../../../core/global/base_use_case.dart';

class GetCurrentLocationUseCase extends BaseUseCase<LatLng, NoParameters> {
  final AddressBaseRepo addressBaseRepo;
  GetCurrentLocationUseCase(this.addressBaseRepo);

  @override
  Future<Either<Failure, LatLng>> call(NoParameters parameters) async => 
  await addressBaseRepo.getCurrentLocation();
  
}