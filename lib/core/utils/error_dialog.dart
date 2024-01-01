import 'package:flutter/material.dart';

import '../resources/strings_manager.dart';

abstract class ErrorDialogUtils {
  static void displayErrorDialog({
    required BuildContext context,
    required String errorMessage,
    VoidCallback? onPressed,
  }) =>
      showDialog(
        context: context,
        builder: (context) =>
            ErrorDialog(errorMessage: errorMessage, onPressed: onPressed),
      );
}

class ErrorDialog extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onPressed;

  const ErrorDialog({
    super.key,
    required this.errorMessage,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(errorMessage, softWrap: true),
      actions: [
        TextButton(
            onPressed: onPressed ?? () => Navigator.of(context).pop(),
            child: Text(StringsManager.okay(context))),
      ],
    );
  }
}
