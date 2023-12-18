import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dartz/dartz.dart';

import '../entities/address.dart';
import '../entities/address_creator.dart';
import '../../../../core/network/failure.dart';

abstract class AddressBaseRepo {
  Future<Either<Failure, String>> sendUserAddress(AddressCreatorEntity address);
  Future<Either<Failure, String>> getAddress(LatLng coordinates);
  Future<Either<Failure, List<AddressEntity>>> getAllAddresses();
  Future<Either<Failure, Unit>> deleteAddress(String addressId);
  Future<Either<Failure, LatLng>> getCurrentLocation();
}
