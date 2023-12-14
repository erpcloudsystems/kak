import 'package:flutter/material.dart';

import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/strings_manager.dart';

class PriceSummary extends StatelessWidget {
  const PriceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: DoubleManager.d_8, vertical: DoubleManager.d_20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringsManager.paymentSummary,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontSize: FontsSize.s16),
          ),
          const PaymentSummaryComponent(
              title: StringsManager.subtotal, amount: 171),
          const PaymentSummaryComponent(
              title: StringsManager.deliveryFee, amount: 30),
          const PaymentSummaryComponent(
              title: StringsManager.totalAmount, amount: 201),
        ],
      ),
    );
  }
}

class PaymentSummaryComponent extends StatelessWidget {
  const PaymentSummaryComponent({
    super.key,
    required this.title,
    required this.amount,
  });
  final String title;
  final double amount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          '${UnTranslatedStrings.egp} $amount',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
