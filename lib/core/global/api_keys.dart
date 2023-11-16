import 'package:flutter/material.dart';

abstract class ConstantKeys {
  // Google maps keys
  static String androidMapsKey = 'AIzaSyDlh6Bsy42KnFubKZsvui_BBcyrxyRrZrs';
  static const String iosMapsKey = 'AIzaSyDBhEU0Z3fmjjFaVPZX2xUdbR8YRG9wsN0';
  static const String serverMapsKey = 'AIzaSyD6Wk1n40RpbWPrS3xf6lNPSTkwbAQqwZ0';

  // Paymob keys
  static const String paymobApiKey =
      'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RRd01UY3hMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuaDFLZTVDbHVRaEVZMDBhcF9jS3JqZmt4TnItblF4N3Z3TG5JR1NLd1lwNjlhcEkyT2Rwa1ZoTEd1Qk50Z0l4T1pLNWdwTDE1WDhZNFFadVFYUG1oM3c=';
  static const int paymobCardIntegrationId = 4347346;

  static getMapsApiKey(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.android) {
      return androidMapsKey;
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      return iosMapsKey;
    }
  }
}
