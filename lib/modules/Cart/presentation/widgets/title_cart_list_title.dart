import 'package:flutter/material.dart';
import 'package:kak/core/resources/colors_manager.dart';

import 'delete_icon.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../meals/domain/entities/meal_entity.dart';
import '../../../meals/domain/entities/meal_component.dart';

class CartListTileTitle extends StatelessWidget {
  const CartListTileTitle({super.key, required this.meal});

  final MealEntity meal;

  @override
  Widget build(BuildContext context) {
    return Row(
      key: key,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  child: Text(
                meal.name,
                overflow: TextOverflow.ellipsis,
                maxLines: IntManager.i_2,
              )),
              Flexible(
                child: Text(
                  overflow: TextOverflow.visible,
                  softWrap: true,
                  getComponentsDescription(meal.components!),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: FontsSize.s10, color: ColorsManager.gBlack),
                ),
              ),
            ],
          ),
        ),
        CartItemDeleteIcon(meal: meal),
      ],
    );
  }

  /// Get every name of every component name and put them together as a description.
  String getComponentsDescription(List<MealComponentEntity> components) =>
      components.map((component) => component.itemName).join(" + ");
}
