import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/strings_manager.dart';

class MealCustomBottomButton extends StatelessWidget {
  const MealCustomBottomButton({
    super.key,
    required this.total,
    required this.onPressed,
  });

  final String total;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      height: DoubleManager.d_90,
      child: Center(
        child: SizedBox(
          width: DoubleManager.d_90.w,
          child: FloatingActionButton(
            backgroundColor: ColorsManager.mainColor,
            shape: const OutlineInputBorder(borderSide: BorderSide.none),
            onPressed: onPressed,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: DoubleManager.d_20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringsManager.addToCart,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white, fontSize: FontsSize.s18),
                    ),
                    Text('${UnTranslatedStrings.egp} $total',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white, fontSize: FontsSize.s18)),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
