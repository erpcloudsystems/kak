import 'package:flutter/material.dart';

import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../meals/domain/entities/meal_entity.dart';

class CartListTileSubtitle extends StatelessWidget {
  const CartListTileSubtitle({super.key, required this.meal});

  final MealEntity meal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            StringsManager.cost,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(width: DoubleManager.d_8),
          Row(
            children: [
              Text(
                meal.price.toString(),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: ColorsManager.swatchRed,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}