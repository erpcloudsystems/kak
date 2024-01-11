import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../bloc/payment_bloc.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/error_dialog.dart';
import '../../../../../core/resources/fonts_manager.dart';
import '../../../../Cart/presentation/bloc/cart_bloc.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/strings_manager.dart';

class PriceSummary extends StatefulWidget {
  const PriceSummary({super.key});

  @override
  State<PriceSummary> createState() => _PriceSummaryState();
}

class _PriceSummaryState extends State<PriceSummary> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      buildWhen: (previous, current) =>
          previous.getTaxesState != current.getTaxesState,
      builder: (context, state) {
        switch (state.getTaxesState) {
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.error:
            ErrorDialogUtils.displayErrorDialog(
                context: context, errorMessage: state.getTaxesMessage);
            return const SizedBox();
          case RequestState.success:
            return PaymentSummarySuccessWidget(
              deliveryFee: state.getTaxesData.deliverFee,
              taxes: state.getTaxesData.taxes,
            );
          default:
            return const SizedBox();
        }
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<PaymentBloc>().add(GetTaxesEvent());
  }
}

class PaymentSummarySuccessWidget extends StatelessWidget {
  const PaymentSummarySuccessWidget({
    super.key,
    required this.deliveryFee,
    required this.taxes,
  });

  final double deliveryFee, taxes;
  @override
  Widget build(BuildContext context) {
    final double subtotal = context.read<CartBloc>().state.totalPrice;
    final double theTaxes =
        double.parse((taxes / 100 * subtotal).toStringAsFixed(2));
    final double theTotal = (taxes / 100 * subtotal) + (subtotal + deliveryFee);
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
            amount: subtotal,
          ),
          PaymentSummaryComponent(
            title: StringsManager.deliveryFee(context),
            amount: deliveryFee,
          ),
          PaymentSummaryComponent(
            title: StringsManager.tax(context),
            amount: theTaxes,
          ),
          PaymentSummaryComponent(
            title: StringsManager.totalAmount(context),
            amount: theTotal,
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
