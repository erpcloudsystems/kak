import 'package:flutter/material.dart';

import 'order_details_section.dart';
import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/colors_manager.dart';

class CustomerDetailsSection extends StatelessWidget {
  const CustomerDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OrderDetailsSection(
        badgeText: 'Your details',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // name:
            const Text('Mohamed Mohamedy'),

            // Address
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: const Icon(
                Icons.location_on_sharp,
                color: ColorsManager.swatchRed,
              ),
              subtitleTextStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: FontsSize.s11),
              subtitle: const Text(
                  'this is a plceholder for address and we should remove it'),
            ),

            // Date
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: const Icon(
                Icons.date_range_rounded,
                color: ColorsManager.gGrey,
              ),
              titleTextStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: FontsSize.s11),
              title: const Text('26 - 12 - 2023'),
            ),

            // Mobile
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: const Icon(
                Icons.call,
                color: ColorsManager.gGrey,
              ),
              titleTextStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: FontsSize.s11),
              title: const Text('+0201101265646'),
            ),
          ],
        ));
  }
}
