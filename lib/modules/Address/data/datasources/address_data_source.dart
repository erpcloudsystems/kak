import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dio/dio.dart';

import '../models/address.dart';
import 'location_helper.dart';
import '../models/address_creator.dart';
import '../../domain/entities/address.dart';
import '../../../../core/network/api_constance.dart';

abstract class AddressBaseDataSource {
  Future<LatLng> getCurrentLocation();
  Future<String> getAddress(LatLng coordinates);
  Future<List<AddressEntity>> getAllAddresses();
  Future<String> sendUserAddress(AddressCreatorModel address);
}

class AddressDataSourceImpl extends LocationServiceClass
    implements AddressBaseDataSource {
  AddressDataSourceImpl(super.dio);

  // Send user Address _______________________________________________
  @override
  Future<String> sendUserAddress(AddressCreatorModel address) async {
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
}
