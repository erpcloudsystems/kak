import 'package:flutter/material.dart';

import '../resources/values_manager.dart';
import '../resources/colors_manager.dart';

class GeneralButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback function;
  const GeneralButton({
    super.key,
    required this.buttonText,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      child: Text(buttonText),
    );
  }
}


class ColoredElevatedButton extends StatelessWidget {
  const ColoredElevatedButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.mainColor,
        foregroundColor: Colors.white,
        elevation: DoubleManager.d_8,
      ),
      child: Text(buttonText),
    );
  }
}

