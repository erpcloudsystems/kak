import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';

import '../../../../core/global/api_keys.dart';
import '../../../../core/network/exceptions.dart';
import '../../../../core/network/dio_helper.dart';

abstract class AddressBaseDataSource {
  Future<LatLng> getCurrentLocation();
  Future<String> getAddress(LatLng coordinates);
}

class AddressDataSourceImpl extends LocationServiceClass
    implements AddressBaseDataSource {
  AddressDataSourceImpl(super.dio);
  @override
  Future<LatLng> getCurrentLocation() async => await getUserCurrentLocation();

  @override
  Future<String> getAddress(LatLng coordinates) async =>
      await getUserAddressUsingGoogleGeoCodingApi(coordinates);
}

class LocationServiceClass {
  final BaseDioHelper dio;
  LocationServiceClass(this.dio);

  Future<LatLng> getUserCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    final location = LatLng(position.latitude, position.longitude);
    return location;
  }

  // This method uses Geocode package I stopped it and used Google geocoding API instead.
  // if you want to use it you have to uncomment the package in pubspec.yaml first.
  // Future<String> getUserAddress(LatLng coordinates) async {
  //   List<Placemark> placemarks = await placemarkFromCoordinates(
  //       coordinates.latitude, coordinates.longitude,
  //       localeIdentifier: 'ar_EG');

  //   final String address = '${placemarks[0].name}';
  //   return address;
  // }

  Future<String> getUserAddressUsingGoogleGeoCodingApi(
      LatLng coordinates) async {
    final response = await dio.get(
        endPoint: 'https://maps.googleapis.com/maps/api/geocode/json',
        query: {
          'latlng': '${coordinates.latitude},${coordinates.longitude}',
          'key': ConstantKeys.serverMapsKey,
        }) as Response;
     if (response.data['status'] == 'OK' && response.data['results'] != null && response.data['results'].isNotEmpty) {
    return response.data['results'][0]['formatted_address'];
  } else {
    throw PrimaryServerException(code: response.statusCode!, error: response.statusMessage!, message: response.data['error_message']);
  }
}
}