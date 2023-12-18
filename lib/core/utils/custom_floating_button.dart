import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../resources/fonts_manager.dart';
import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DoubleManager.d_90.w,
      child: FloatingActionButton(
        backgroundColor: ColorsManager.mainColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DoubleManager.d_12)),
        onPressed: onPressed,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white, fontSize: FontsSize.s18),
        ),
      ),
    );
  }
}
