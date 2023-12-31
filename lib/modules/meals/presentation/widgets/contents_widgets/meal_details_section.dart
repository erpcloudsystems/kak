import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'choices_section.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/utils/custom_cached_image.dart';

class MealDetailsSection extends StatelessWidget {
  const MealDetailsSection({
    super.key,
    required this.widget,
    required this.index,
  });

  final ChoicesSection widget;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image
        CircleAvatar(
          radius: DoubleManager.d_25,
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: CustomCachedImage(url: widget.choicesList[index].image),
          ),
        ),
        const SizedBox(width: DoubleManager.d_8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Item name
            SizedBox(
              width: DoubleManager.d_55.w,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: AlignmentDirectional.centerStart,
                child: Text(widget.choicesList[index].itemName),
              ),
            ),
            Row(
              // Item price - if it's greater than 0 -.
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.choicesList[index].price > DoubleManager.d_0)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        end: DoubleManager.d_30),
                    child: Text(
                      '${StringsManager.cost(context)} ${widget.choicesList[index].price.toString()}',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: ColorsManager.swatchRed),
                    ),
                  ),
                // Item quantity
                Text(
                  '${StringsManager.quantity(context)} ${widget.choicesList[index].quantity}',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: ColorsManager.swatchRed,
                      ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
