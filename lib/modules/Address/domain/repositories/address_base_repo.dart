import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';

abstract class AddressBaseRepo {
  Future<Either<Failure, String>> getAddress(LatLng coordinates);
  Future<Either<Failure, LatLng>> getCurrentLocation();
}