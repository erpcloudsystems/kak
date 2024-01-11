import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dartz/dartz.dart';

import '../entities/address.dart';
import '../entities/google_address.dart';
import '../../../../core/network/failure.dart';

abstract class AddressBaseRepo {
  Future<Either<Failure, GoogleAddressEntity>> getAddress(LatLng coordinates);
  Future<Either<Failure, String>> sendUserAddress(AddressEntity address);
  Future<Either<Failure, Unit>> setPrimaryAddress(String addressId);
  Future<Either<Failure, List<AddressEntity>>> getAllAddresses();
  Future<Either<Failure, Unit>> deleteAddress(String addressId);
  Future<Either<Failure, LatLng>> getCurrentLocation();
}
