import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kak/modules/Cart/presentation/bloc/cart_bloc.dart';

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
            StringsManager.paymentSummary(context),
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontSize: FontsSize.s16),
          ),
          PaymentSummaryComponent(
            title: StringsManager.subtotal(context),
            amount: context.read<CartBloc>().state.totalPrice,
          ),
           PaymentSummaryComponent(
            title: StringsManager.deliveryFee(context),
            amount: 30,
          ),
           PaymentSummaryComponent(
            title: StringsManager.tax(context),
            amount: 30,
          ),
           PaymentSummaryComponent(
            title: StringsManager.totalAmount(context),
            amount: 201,
          ),
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
