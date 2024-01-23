import 'package:flutter/material.dart';

import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/strings_manager.dart';

class DeliveryTime extends StatelessWidget {
  const DeliveryTime({
    super.key,
    required this.deliveryTime,
  });

  final int deliveryTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: DoubleManager.d_60,
          left: DoubleManager.d_8,
          right: DoubleManager.d_8),
      padding: const EdgeInsets.symmetric(
          horizontal: DoubleManager.d_10, vertical: DoubleManager.d_15),
      decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.gGrey),
          borderRadius: BorderRadius.circular(DoubleManager.d_12)),
      child: Row(children: [
        const Icon(Icons.motorcycle_rounded),
        const SizedBox(width: DoubleManager.d_10),
        Text(StringsManager.deliveryTime(deliveryTime)),
      ]),
    );
  }
}
