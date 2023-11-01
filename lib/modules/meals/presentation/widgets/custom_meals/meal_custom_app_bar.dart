import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../upper_screen_meal_image.dart';
import '../../../domain/entities/meal_entity.dart';
import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/values_manager.dart';

class MealsCustomSliverAppBar extends StatelessWidget {
  const MealsCustomSliverAppBar({
    super.key,
    required this.meal,
    required this.isScrolledTo25Percent,
  });

  final bool isScrolledTo25Percent;
  final MealEntity meal;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      centerTitle: false,
      leading:
          isScrolledTo25Percent ? const BackButton() : const SizedBox.shrink(),
      expandedHeight: DoubleManager.d_25.h,
      backgroundColor: Colors.white,
      shadowColor: Colors.grey,
      surfaceTintColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: isScrolledTo25Percent
            ? Text(
                meal.name,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: FontsSize.s18, color: Colors.black),
              )
            : const SizedBox.shrink(),
        background: UpperScreenMealImage(imageUrl: meal.imageUrl),
      ),
    );
  }
}
