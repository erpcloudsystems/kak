import 'package:flutter/material.dart';

import '../../../domain/entities/meal_entity.dart';
import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../Cart/presentation/widgets/cart_list_tile_icon.dart';

class DescriptionSection extends StatefulWidget {
  const DescriptionSection({
    super.key,
    required this.meal,
    required this.quantity,
    required this.price,
  });

  final MealEntity meal;
  final ValueNotifier<int> quantity;
  final ValueNotifier<double> price;

  @override
  State<DescriptionSection> createState() => _DescriptionSectionState();
}

class _DescriptionSectionState extends State<DescriptionSection> {
  bool isNegative = false;

  @override
  Widget build(BuildContext context) {
    widget.quantity.addListener(() {
      setState(() => isNegative = widget.quantity.value <= 0);
    });
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: DoubleManager.d_10),
        padding: const EdgeInsets.symmetric(
          horizontal: DoubleManager.d_10,
          vertical: DoubleManager.d_20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Meal's name
            Text(
              widget.meal.name,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: FontsSize.s20),
            ),

            // Meal's components
            Text(
              widget.meal.description,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: FontsSize.s14),
            ),

            const SizedBox(height: DoubleManager.d_20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Meal's Price
                ValueListenableBuilder<double>(
                  valueListenable: widget.price,
                  builder: (context, price, child) {
                    return Text(
                      'EGP $price',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontSize: FontsSize.s16),
                    );
                  },
                ),

                // Meal's Quantity
                Container(
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
                    borderRadius: const BorderRadius.all(
                        Radius.circular(DoubleManager.d_5)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CartListTileIcon(
                        isNegative: isNegative,
                        onTab: () =>
                            widget.quantity.value = widget.quantity.value - 1,
                        icon: Icons.remove,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: DoubleManager.d_10),
                        child: ValueListenableBuilder<int>(
                          valueListenable: widget.quantity,
                          builder: (context, value, child) => Text(
                            value.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: ColorsManager.swatchRed,
                                  fontSize: FontsSize.s18,
                                ),
                          ),
                        ),
                      ),
                      CartListTileIcon(
                        isNegative: false,
                        onTab: () =>
                            widget.quantity.value = widget.quantity.value + 1,
                        icon: Icons.add,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
