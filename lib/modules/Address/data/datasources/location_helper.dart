import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/exceptions.dart';
import '../../../../core/network/dio_helper.dart';
import '../../domain/entities/google_address.dart';
import '../../../../core/global/constant_keys.dart';
import '../../../../core/network/api_constance.dart';
import '../models/google_address.dart';

class LocationServiceClass {
  final BaseDioHelper dio;
  LocationServiceClass(this.dio);

  Future<LatLng> getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    final location = LatLng(position.latitude, position.longitude);
    return location;
  }

  Future<GoogleAddressEntity> getAddress(LatLng coordinates) async {
    final response = await dio.get(
      useCookies: false,
      base: ApiConstance.googleMapsBaseUrl,
      endPoint: ApiConstance.googleMapsGeocodeApi,
      query: {
        'latlng': '${coordinates.latitude},${coordinates.longitude}',
        'key': ConstantKeys.serverMapsKey,
      },
    ) as Response;
    if (response.data['status'] == 'OK') {
      final data = GoogleAddressModel.fromJson(response.data);
      return data;

      // if (response.data['status'] == 'OK' &&
      //     response.data['results'] != null &&
      //     response.data['results'].isNotEmpty) {
      //   return response.data['results'][0]['formatted_address'];
    } else {
      throw PrimaryServerException(
          code: response.statusCode!,
          error: response.statusMessage!,
          message: response.data['error_message']);
    }
  }
}
