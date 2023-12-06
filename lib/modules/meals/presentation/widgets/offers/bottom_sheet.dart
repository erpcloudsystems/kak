import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../quantity_counter.dart';
import '../meal_add_to_cart_btn.dart';
import '../upper_screen_meal_image.dart';
import '../../../domain/entities/meal_entity.dart';
import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/strings_manager.dart';

class OffersBottomSheetView extends StatefulWidget {
  const OffersBottomSheetView({super.key, required this.meal});

  final MealEntity meal;

  @override
  State<OffersBottomSheetView> createState() => _OffersBottomSheetViewState();
}

class _OffersBottomSheetViewState extends State<OffersBottomSheetView> {
  late ValueNotifier<int> quantity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DoubleManager.d_80.h,
      child: ListView(
        children: [
          // Image
          SizedBox(
            height: DoubleManager.d_30.h,
            child: UpperScreenMealImage(
              imageUrl: widget.meal.imageUrl,
            ),
          ),

          // Name
          Padding(
            padding: const EdgeInsets.all(DoubleManager.d_10),
            child: Text(
              widget.meal.name,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),

          // Description
          Padding(
            padding: const EdgeInsets.all(DoubleManager.d_10),
            child: Text(
              widget.meal.description,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorsManager.gGrey,
                    fontWeight: FontsWeightManager.bold,
                    fontSize: FontsSize.s13,
                  ),
            ),
          ),

          // Price
          Padding(
            padding: const EdgeInsets.all(DoubleManager.d_10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    // EGP
                    text: '${UnTranslatedStrings.egp}  ',
                    style: TextStyle(
                      color: ColorsManager.gBlack,
                      fontSize: FontsSize.s16,
                      fontWeight: FontsWeightManager.bold,
                    ),
                    children: [
                      // Old price
                      TextSpan(
                        text: widget.meal.price.toString(),
                        style: TextStyle(
                          color: ColorsManager.gBlack,
                          fontSize: FontsSize.s14,
                          fontWeight: FontsWeightManager.light,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      // Price after discount
                      TextSpan(
                        text:
                            '   ${widget.meal.priceAfterDiscount.toString()}', // your new price
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  color: ColorsManager.swatchRed,
                                  fontSize: FontsSize.s16,
                                ),
                      ),
                    ],
                  ),
                ),
                
                // Quantity counter
                QuantityCounter(quantity: quantity),
              ],
            ),
          ),
          SizedBox(height: DoubleManager.d_5.h),
          MealAddToCartBut(meal: widget.meal, quantity: quantity),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    quantity = ValueNotifier<int>(widget.meal.quantity ?? IntManager.i_1);
  }

  @override
  void dispose() {
    super.dispose();
    quantity.dispose();
  }
}