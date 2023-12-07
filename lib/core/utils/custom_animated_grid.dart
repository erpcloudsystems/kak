import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/material.dart';

import 'custom_animated_grid_child.dart';
import '../resources/values_manager.dart';
import '../../modules/meals/domain/entities/meal_entity.dart';

class CustomAnimatedGrid extends StatelessWidget {
  final List<MealEntity> items;
  const CustomAnimatedGrid({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(DoubleManager.d_10),
        child: AnimationLimiter(
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: IntManager.i_3,
              crossAxisSpacing: DoubleManager.d_10,
              mainAxisSpacing: DoubleManager.d_30,
              childAspectRatio: DoubleManager.d_05,
            ),
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 375),
                columnCount: IntManager.i_3,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: CustomAnimatedGridChild(meal: items[index]),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
