import 'package:flutter/material.dart';

import 'order_details_section.dart';
import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../meals/domain/entities/meal_entity.dart';
import '../../../../../core/resources/strings_manager.dart';

class OrderDetailsItemsSection extends StatelessWidget {
  const OrderDetailsItemsSection({super.key, required this.meals});

  final List<MealEntity> meals;

  @override
  Widget build(BuildContext context) {
    return OrderDetailsSection(
        badgeText: StringsManager.items(context),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: DoubleManager.d_20),
            child: Divider(thickness: DoubleManager.d_05),
          ),
          itemCount: meals.length,
          itemBuilder: (context, index) => ListTile(
            // Leading
            leading: Text('X ${meals[index].quantity}'),
            leadingAndTrailingTextStyle:
                Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: ColorsManager.mainColor,
                      fontSize: FontsSize.s10,
                    ),
            // name
            title: Text(meals[index].name),
            titleTextStyle: Theme.of(context).textTheme.bodyMedium,

            // Price
            trailing: Text('${meals[index].price}  ${UnTranslatedStrings.egp}'),
          ),
        ));
  }
}
