import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/address.dart';
import 'location_helper.dart';
import '../../domain/entities/address.dart';
import '../../domain/entities/google_address.dart';
import '../../../../core/network/api_constance.dart';

abstract class AddressBaseDataSource {
  Future<GoogleAddressEntity> getAddress(LatLng coordinates);
  Future<String> sendUserAddress(AddressModel address);
  Future<Unit> setPrimaryAddress(String addressId);
  Future<List<AddressEntity>> getAllAddresses();
  Future<Unit> deleteAddress(String addressId);
  Future<LatLng> getCurrentLocation();
}

class AddressDataSourceImpl extends LocationServiceClass
    implements AddressBaseDataSource {
  AddressDataSourceImpl(super.dio);

  // Send user Address _______________________________________________
  @override
  Future<String> sendUserAddress(AddressModel address) async {
    final result = await dio.post(
      endPoint: ApiConstance.sendUserAddress,
      query: address.toJson(),
      useCookies: true,
    ) as Response;

    final addressId = result.data['message'];

    return addressId;
  }

  // Get all Addresses _______________________________________________
  @override
  Future<List<AddressEntity>> getAllAddresses() async {
    final response = await dio.get(
        endPoint: ApiConstance.getAllAddressesEndpoint) as Response;

    final data = List.from(response.data['message'])
        .map((e) => AddressModel.fromJson(e))
        .toList();

    return data;
  }

  // Delete address ___________________________________________________
  @override
  Future<Unit> deleteAddress(String addressId) async {
    await dio.post(
      endPoint: ApiConstance.deleteAddress,
      query: {'address_name': addressId},
      useCookies: true,
    ) as Response;

    return Future.value(unit);
  }

  // set primary address _______________________________________________
  @override
  Future<Unit> setPrimaryAddress(String addressId) async {
    await dio.post(
      endPoint: ApiConstance.setPrimaryAddressEndPoint,
      useCookies: true,
      query: {'address_name': addressId},
    );

    return Future.value(unit);
  }
}
