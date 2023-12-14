import 'package:flutter/material.dart';

import '../../../../../core/utils/general_button.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/strings_manager.dart';

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: DoubleManager.d_8,
        right: DoubleManager.d_8,
        bottom: DoubleManager.d_15,
      ),
      child: ColoredElevatedButton(
        onPressed: () {},
        buttonText: StringsManager.placeOrder,
      ),
    );
  }
}
