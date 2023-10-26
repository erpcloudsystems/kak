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
      title: Text(
        StringsManager.total,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.grey, fontSize: FontsSize.s12),
      ),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.attach_money,
            size: DoubleManager.d_16.sp,
          ),
          Text(
            total,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: FontsSize.s16),
          )
        ],
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
                    color: Colors.white,
                  )),
        ),
      ),
    ));
  }
}
