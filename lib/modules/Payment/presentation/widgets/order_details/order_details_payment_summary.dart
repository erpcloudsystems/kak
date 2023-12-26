import 'package:flutter/material.dart';
import 'package:kak/core/resources/fonts_manager.dart';
import 'package:kak/core/resources/strings_manager.dart';
import 'package:kak/modules/Payment/presentation/widgets/order_details/order_details_section.dart';

class OrderDetailsPaymentSummary extends StatelessWidget {
  const OrderDetailsPaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return OrderDetailsSection(
      badgeText: StringsManager.paymentSummary,
      child: Column(children: [
        const SizedBox(height: 10),
        // SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              StringsManager.subtotal,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: FontsSize.s12),
            ),
            Text(
              '254 ${UnTranslatedStrings.egp}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: FontsSize.s12),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Delivery fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              StringsManager.deliveryFee,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '30 ${UnTranslatedStrings.egp}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Tax
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              StringsManager.tax,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '19 ${UnTranslatedStrings.egp}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '500 ${UnTranslatedStrings.egp}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ]),
    );
  }
}
