import 'package:flutter/material.dart';
import 'package:kak/core/resources/colors_manager.dart';
import 'package:kak/core/resources/strings_manager.dart';
import 'package:kak/core/resources/values_manager.dart';
import 'package:kak/core/utils/general_button.dart';
import 'package:kak/modules/Payment/domain/entities/orders_list_item.dart';
import 'package:kak/modules/authentication/presentation/widgets/sign_screen_components/sign_screens_shared_components/main_logo.dart';

class OrdersListCard extends StatelessWidget {
  const OrdersListCard({super.key, required this.item});

  final OrdersListItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: DoubleManager.d_0,
      shape: const Border(
        top: BorderSide(color: ColorsManager.gBlack, width: DoubleManager.d_05),
        bottom:
            BorderSide(color: ColorsManager.gBlack, width: DoubleManager.d_05),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DoubleManager.d_10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo
                Container(
                  height: DoubleManager.d_50,
                  width: DoubleManager.d_50,
                  padding: const EdgeInsets.all(DoubleManager.d_5),
                  margin:
                      const EdgeInsets.symmetric(horizontal: DoubleManager.d_5),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: DoubleManager.d_05,
                        color: ColorsManager.gGrey,
                      ),
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadiusDirectional.all(
                          Radius.circular(DoubleManager.d_12))),
                  child: const FittedBox(
                    fit: BoxFit.fill,
                    child: MainLogo(),
                  ),
                ),

                // Data & status
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(StringsManager.date),
                        const SizedBox(width: DoubleManager.d_5),
                        Text(
                          item.transactionDate,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: DoubleManager.d_5),
                    Row(
                      children: [
                        const Text(StringsManager.status),
                        const SizedBox(width: DoubleManager.d_5),
                        Text(
                          item.status.name,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                // Price
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Row(
                    children: [
                       Text(item.price.toString()),
                      const SizedBox(width: DoubleManager.d_5),
                      Text(
                        UnTranslatedStrings.egp,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                )
              ],
            ),

            const SizedBox(height: DoubleManager.d_40),
            // Button
            ColoredElevatedButton(
              // TODO: Add reorder logic
              onPressed: () {},
              buttonText: StringsManager.reorder,
            ),
          ],
        ),
      ),
    );
  }
}