import 'package:flutter/material.dart';

import 'order_details_section.dart';
import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../domain/entities/received_order_entity.dart';

class CustomerDetailsSection extends StatelessWidget {
  const CustomerDetailsSection({super.key, required this.order});

  final ReceivedOrderEntity order;

  @override
  Widget build(BuildContext context) {
    return OrderDetailsSection(
        badgeText: StringsManager.urDetails(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // name:
            Text(order.customerName),

            // Address
            ListTile(
              contentPadding: const EdgeInsets.all(DoubleManager.d_0),
              leading: const Icon(
                Icons.location_on_sharp,
                color: ColorsManager.swatchRed,
              ),
              subtitleTextStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: FontsSize.s11),
              subtitle: Text(order.customerAddress),
            ),

            // Date
            ListTile(
              contentPadding: const EdgeInsets.all(DoubleManager.d_0),
              leading: const Icon(
                Icons.date_range_rounded,
                color: ColorsManager.gGrey,
              ),
              titleTextStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: FontsSize.s11),
              title: Text(order.date),
            ),

            // Mobile
            ListTile(
              contentPadding: const EdgeInsets.all(DoubleManager.d_0),
              leading: const Icon(
                Icons.call,
                color: ColorsManager.gGrey,
              ),
              titleTextStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: FontsSize.s11),
              title: Text(order.mobileNumber),
            ),
          ],
        ));
  }
}
