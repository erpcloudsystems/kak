import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../domain/entities/meal_entity.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/custom_cached_image.dart';

class FeaturedMeals extends StatelessWidget {
  const FeaturedMeals({super.key, required this.featuredMeals});

  final List<MealEntity> featuredMeals;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33.h,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: featuredMeals.length,
        separatorBuilder: (context, index) =>
            const SizedBox(height: DoubleManager.d_20),
        itemBuilder: (context, index) =>
            FeaturedMealsElement(meal: featuredMeals[index]),
      ),
    );
  }
}

class FeaturedMealsElement extends StatelessWidget {
  const FeaturedMealsElement({
    super.key,
    required this.meal,
  });

  final MealEntity meal;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: DoubleManager.d_8,
        margin: const EdgeInsets.symmetric(horizontal: DoubleManager.d_10),
        child: Container(
          height: DoubleManager.d_15.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(DoubleManager.d_20),
          ),
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: DoubleManager.d_8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(meal.name),
                    const Spacer(),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: DoubleManager.d_30,
                            width: DoubleManager.d_130,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorsManager.mainColor,
                                  shape: const ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              DoubleManager.d_20)))),
                              // TODO: Implement add to cart logic
                              onPressed: () {},
                              child: Text(StringsManager.addToCart,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        fontSize: FontsSize.s12,
                                        color: Colors.white,
                                      )),
                            ),
                          ),
                          const SizedBox(width: DoubleManager.d_15),
                          Text('EGP ${meal.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    fontSize: FontsSize.s14,
                                    color: ColorsManager.mainColor,
                                  ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CustomCachedImage(
                  url: meal.imageUrl,
                  height: DoubleManager.d_120,
                ),
              ),
            ],
          ),
        ));
  }
}
