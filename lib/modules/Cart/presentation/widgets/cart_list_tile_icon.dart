import 'package:flutter/material.dart';

import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/colors_manager.dart';

class CartListTileIcon extends StatelessWidget {
  final VoidCallback onTab;
  final bool isNegative;
  final IconData icon;
  const CartListTileIcon({
    super.key,
    required this.onTab,
    required this.icon,
    required this.isNegative,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isNegative ? () {} : onTab,
      child: Container(
        height: DoubleManager.d_20,
        width: DoubleManager.d_20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isNegative ? Colors.grey : ColorsManager.swatchRed,
            borderRadius: BorderRadius.circular(DoubleManager.d_4)),
        child: Icon(
          icon,
          color: Colors.white,
          size: DoubleManager.d_20,
        ),
      ),
    );
  }
}
