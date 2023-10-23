import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'appetizers_element.dart';
import '../../../../core/resources/values_manager.dart';

const String imageTest =
    'https://w7.pngwing.com/pngs/539/557/png-transparent-pepsi-soda-can-pepsi-max-soft-drink-coca-cola-pepsi-s-food-cola-electric-blue.png';

class AppetizersSection extends StatelessWidget {
  const AppetizersSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: DoubleManager.d_10.h,
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: IntManager.i_1,
          crossAxisSpacing: DoubleManager.d_10,
          mainAxisSpacing: DoubleManager.d_30,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const AppetizersElement(imageUrl: imageTest);
        },
      ),
    );
  }
}
