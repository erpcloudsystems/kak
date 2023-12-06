import 'package:flutter/material.dart';

import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../Cart/presentation/widgets/cart_list_tile_icon.dart';

class QuantityCounter extends StatefulWidget {
  const QuantityCounter({super.key, required this.quantity});

  final ValueNotifier<int> quantity;

  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  bool isNegative = false;
  @override
  Widget build(BuildContext context) {
    widget.quantity.addListener(() {
      setState(() => isNegative = widget.quantity.value < 1);
    });
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DoubleManager.d_10,
        vertical: DoubleManager.d_5,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            offset: const Offset(0, 2),
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
        color: Colors.white,
        borderRadius:
            const BorderRadius.all(Radius.circular(DoubleManager.d_5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CartListTileIcon(
            isNegative: isNegative,
            onTab: () {
              if (widget.quantity.value > 1) {
                widget.quantity.value = widget.quantity.value - 1;
              }
            },
            icon: Icons.remove,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DoubleManager.d_10),
            child: ValueListenableBuilder<int>(
              valueListenable: widget.quantity,
              builder: (context, value, child) => Text(
                value.toString(),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: ColorsManager.swatchRed,
                      fontSize: FontsSize.s18,
                    ),
              ),
            ),
          ),
          CartListTileIcon(
            isNegative: false,
            onTab: () => widget.quantity.value = widget.quantity.value + 1,
            icon: Icons.add,
          )
        ],
      ),
    );
  }
}
