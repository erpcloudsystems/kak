import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

abstract class AddressBaseDataSource {
  Future<LatLng> getCurrentLocation();
}

class AddressDataSourceImpl
    with LocationServiceClass
    implements AddressBaseDataSource {
  @override
  Future<LatLng> getCurrentLocation() async => await getUserCurrentLocation();
}

mixin LocationServiceClass {
  Future<LatLng> getUserCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    final location = LatLng(position.latitude, position.longitude);
    return location;
  }
}