import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

abstract class AddressBaseDataSource {
  Future<LatLng> getCurrentLocation();
  Future<String> getAddress(LatLng coordinates);
}

class AddressDataSourceImpl
    with LocationServiceClass
    implements AddressBaseDataSource {
  @override
  Future<LatLng> getCurrentLocation() async => await getUserCurrentLocation();

  @override
  Future<String> getAddress(LatLng coordinates) async =>
      await getUserAddress(coordinates);
}

mixin LocationServiceClass {
  Future<LatLng> getUserCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    final location = LatLng(position.latitude, position.longitude);
    return location;
  }

  Future<String> getUserAddress(LatLng coordinates) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        coordinates.latitude, coordinates.longitude,
        localeIdentifier: 'ar_EG');

    final String address = '${placemarks[0].name}';

    return address;
  }
}
