import 'package:flutter/material.dart';

import 'order_details_section.dart';
import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../domain/entities/received_order_entity.dart';

class OrderDetailsPaymentSummary extends StatelessWidget {
  const OrderDetailsPaymentSummary({super.key, required this.order});

  final ReceivedOrderEntity order;

  @override
  Widget build(BuildContext context) {
    return OrderDetailsSection(
      badgeText: StringsManager.paymentSummary(context),
      child: Column(children: [
        const SizedBox(height: DoubleManager.d_10),
        // SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              StringsManager.subtotal(context),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: FontsSize.s12),
            ),
            Text(
              '${order.subTotal} ${UnTranslatedStrings.egp}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: FontsSize.s12),
            ),
          ],
        ),
        const SizedBox(height: DoubleManager.d_10),
        // Delivery fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              StringsManager.deliveryFee(context),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '${order.delivery} ${UnTranslatedStrings.egp}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: DoubleManager.d_10),
        // Tax
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              StringsManager.tax(context),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '${order.tax} ${UnTranslatedStrings.egp}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: DoubleManager.d_10),

        // Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              StringsManager.total(context),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '${order.total} ${UnTranslatedStrings.egp}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ]),
    );
  }
}
