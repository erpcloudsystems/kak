import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dartz/dartz.dart';

import '../entities/address.dart';
import '../../../../core/network/failure.dart';

abstract class AddressBaseRepo {
  Future<Either<Failure, Unit>> sendUserAddress(AddressEntity address);
  Future<Either<Failure, String>> getAddress(LatLng coordinates);
  Future<Either<Failure, LatLng>> getCurrentLocation();
}