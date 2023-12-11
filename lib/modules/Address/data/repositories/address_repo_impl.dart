import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dartz/dartz.dart';

import '../models/address.dart';
import 'package:dartz/dartz.dart' as dartz;
import '../../domain/entities/address.dart';
import '../../../../core/network/failure.dart';
import '../datasources/address_data_source.dart';
import '../../../../core/network/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../domain/repositories/address_base_repo.dart';
import '../../../../core/network/helper_network_methods.dart';

class AddressRepoImpl implements AddressBaseRepo {
  final AddressBaseDataSource addressBaseDataSource;
  final BaseNetworkInfo networkInfo;
  AddressRepoImpl(this.addressBaseDataSource, this.networkInfo);

// _______________________ Current Location _________________________
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

// _______________________ Current Address __________________________
  @override
  Future<Either<Failure, String>> getAddress(LatLng coordinates) async {
    if (await networkInfo.isConnected) {
      try {
        final address = await addressBaseDataSource.getAddress(coordinates);
        return Right(address);
      } on PrimaryServerException catch (error) {
        return Left(ServerFailure(errorMessage: error.message));
      }
    } else {
      return const Left(OfflineFailure());
    }
  }

// _______________________ Send user Address _________________________
  @override
  Future<Either<Failure, dartz.Unit>> sendUserAddress(
      AddressEntity address) async {
    final userAddress = AddressModel(
      googleAddress: address.googleAddress,
      apartmentNumber: address.apartmentNumber,
      buildingName: address.buildingName,
      isPrimary: address.isPrimary,
      street: address.street,
      additionalDirections: address.additionalDirections,
      floor: address.floor,
    );
    return await HelperNetworkMethods.commonApiResponseMethod(
        () async => await addressBaseDataSource.sendUserAddress(userAddress),
        networkInfo);
  }
}
