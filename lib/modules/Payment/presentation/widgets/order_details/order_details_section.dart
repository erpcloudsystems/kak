import 'package:flutter/material.dart';

import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/colors_manager.dart';

class OrderDetailsSection extends StatelessWidget {
  const OrderDetailsSection(
      {super.key, required this.child, required this.badgeText});

  final Widget child;
  final String badgeText;
  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
          padding: const EdgeInsets.all(DoubleManager.d_15),
          margin: const EdgeInsets.symmetric(vertical: DoubleManager.d_20),
          decoration: ShapeDecoration(
              color: ColorsManager.gWhite,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(DoubleManager.d_10))),
          child: child),
      Positioned(
        top: -DoubleManager.d_25,
        child: Container(
          padding: const EdgeInsets.all(DoubleManager.d_8),
          margin: const EdgeInsets.symmetric(vertical: DoubleManager.d_20),
          decoration: ShapeDecoration(
            color: ColorsManager.swatchRed.withOpacity(.8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(DoubleManager.d_10)),
          ),
          child: Text(
            badgeText,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    ]);
  }
}
