import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/meal_entity.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/colors_manager.dart';

class OfferDotsIndicator extends StatelessWidget {
  const OfferDotsIndicator({
    super.key,
    required this.currentSliderIndex,
    required this.offersList,
  });

  final int currentSliderIndex;
  final List<MealEntity> offersList;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: DoubleManager.d_20,
      child: AnimatedSmoothIndicator(
        textDirection: TextDirection.ltr,
        axisDirection: Axis.horizontal,
        effect: const ExpandingDotsEffect(
          activeDotColor: ColorsManager.mainColor,
          dotColor: Colors.white,
          dotHeight: DoubleManager.d_10,
          dotWidth: DoubleManager.d_10,
          radius: DoubleManager.d_10,
          expansionFactor: DoubleManager.d_5,
        ),
        activeIndex: currentSliderIndex,
        count: offersList.length,
      ),
    );
  }
}