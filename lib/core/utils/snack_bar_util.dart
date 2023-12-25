import 'package:flutter/material.dart';

import '../resources/colors_manager.dart';

class SnackBarUtil {
  void getSnackBar({
    required BuildContext context,
    required String message,
    required Color color,
  }) {
    
    // Close the old SnackBar
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: ColorsManager.gWhite)),
        backgroundColor: color,
      ),
    );
  }
}
