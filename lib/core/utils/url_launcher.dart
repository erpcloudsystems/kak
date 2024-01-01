import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import 'snack_bar_util.dart';
import '../resources/colors_manager.dart';
import '../resources/strings_manager.dart';

abstract class UrlLauncherHelper {
  /// Function to launch URL
  static urlLauncherMethod(BuildContext context, String webUrl) async {
    final url = Uri.parse(webUrl);
    await canLaunchUrl(url).then((value) async {
      switch (value) {
        case true:
          await launchUrl(url);
          break;
        case false:
          SnackBarUtil().getSnackBar(
            context: context,
            message: StringsManager.unKnownErrorOccurred(context),
            color: ColorsManager.gRed,
          );
      }
    });
  }
}
