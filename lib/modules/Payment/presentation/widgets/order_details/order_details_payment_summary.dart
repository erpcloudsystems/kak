import 'package:flutter/material.dart';
import 'package:kak/core/resources/fonts_manager.dart';
import 'package:kak/core/resources/strings_manager.dart';
import 'package:kak/core/resources/values_manager.dart';
import 'package:kak/modules/Payment/presentation/widgets/order_details/order_details_section.dart';

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
              // TODO: ASK BACKEND FOR SUBTOAL IN THE ORDER DETAILS.
              '${order.price} ${UnTranslatedStrings.egp}',
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
              StringsManager.deliveryFee(context),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '${order.delivery} ${UnTranslatedStrings.egp}',
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
              StringsManager.tax(context),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '${order.tax} ${UnTranslatedStrings.egp}',
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
              StringsManager.total(context),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '${order.price} ${UnTranslatedStrings.egp}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ]),
    );
  }
}
