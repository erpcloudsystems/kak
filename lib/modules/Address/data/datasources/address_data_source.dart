import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dio/dio.dart';

import 'location_helper.dart';
import '../models/address_creator.dart';
import '../../../../core/network/api_constance.dart';

abstract class AddressBaseDataSource {
  Future<LatLng> getCurrentLocation();
  Future<String> getAddress(LatLng coordinates);
  Future<String> sendUserAddress(AddressCreatorModel address);
}

class AddressDataSourceImpl extends LocationServiceClass
    implements AddressBaseDataSource {
  AddressDataSourceImpl(super.dio);

  @override
  Future<String> sendUserAddress(AddressCreatorModel address) async {
    final result = await dio.post(
      endPoint: ApiConstance.sendUserAddress,
      query: address.toJson(),
    ) as Response;

    final addressId = result.data['message'];

    return addressId;
  }
}
