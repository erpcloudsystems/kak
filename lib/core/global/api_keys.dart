import 'package:flutter/material.dart';

abstract class ConstantKeys {
  static String androidMapsKey = 'AIzaSyDlh6Bsy42KnFubKZsvui_BBcyrxyRrZrs';
  static const String iosMapsKey = 'AIzaSyDBhEU0Z3fmjjFaVPZX2xUdbR8YRG9wsN0';
  static const String serverMapsKey = 'AIzaSyD6Wk1n40RpbWPrS3xf6lNPSTkwbAQqwZ0';

  static getApiKey(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.android) {
      return androidMapsKey;
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      return iosMapsKey;
    }
  }
}
