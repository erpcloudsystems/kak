import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/network/api_constance.dart';
import '../models/address.dart';
import 'location_helper.dart';

abstract class AddressBaseDataSource {
  Future<LatLng> getCurrentLocation();
  Future<String> getAddress(LatLng coordinates);
  Future<Unit> sendUserAddress(AddressModel address);
}

class AddressDataSourceImpl extends LocationServiceClass
    implements AddressBaseDataSource {
  AddressDataSourceImpl(super.dio);

  @override
  Future<Unit> sendUserAddress(AddressModel address) async {
    await dio.post(
      endPoint: ApiConstance.sendUserAddress,
      query: address.toJson(),
    );
    return Future.value(unit);
  }
}
