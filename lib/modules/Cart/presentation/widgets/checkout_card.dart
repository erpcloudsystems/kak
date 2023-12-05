import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'cart_card.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class TotalCard extends StatelessWidget {
  final VoidCallback checkoutFunction;
  final String total;

  const TotalCard({
    super.key,
    required this.checkoutFunction,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return CartCard(
        child: ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: DoubleManager.d_8),
        child: Text(
          StringsManager.total,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: ColorsManager.gGrey, fontSize: FontsSize.s12),
        ),
      ),
      subtitle: Text(
        'EGP $total',
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(fontSize: FontsSize.s16),
      ),
      trailing: SizedBox(
        width: DoubleManager.d_40.w,
        child: ElevatedButton(
          onPressed: checkoutFunction,
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.mainColor,
              elevation: DoubleManager.d_8,
              shape: const ContinuousRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(DoubleManager.d_20)))),
          child: Text(StringsManager.createOrder,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: FontsSize.s13,
                    color: ColorsManager.gWhite,
                  )),
        ),
      ),
    ));
  }
}
