import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../datasources/address_data_source.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../domain/repositories/address_base_repo.dart';

class AddressRepoImpl implements AddressBaseRepo {
  final AddressBaseDataSource addressBaseDataSource;
  AddressRepoImpl(this.addressBaseDataSource);

  @override
  Future<Either<Failure, LatLng>> getCurrentLocation() async {
    LocationPermission permission;
    bool serviceEnabled;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const PermissionDeniedException(StringsManager.enableLocation);
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw const PermissionDeniedException(StringsManager.accessLocation);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw const PermissionDeniedException(StringsManager.accessLocation);
    }

    try {
      final currentLocation = await addressBaseDataSource.getCurrentLocation();
      return Right(currentLocation);
    } on PermissionDeniedException catch (error) {
      return Left(PermissionFailure(errorMessage: error.toString()));
    }
  }
}
