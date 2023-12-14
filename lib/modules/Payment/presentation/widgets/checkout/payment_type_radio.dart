import 'package:flutter/material.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/strings_manager.dart';

class PaymentTypeRadio extends StatefulWidget {
  const PaymentTypeRadio({super.key});

  @override
  State<PaymentTypeRadio> createState() => _RadioFormState();
}

class _RadioFormState extends State<PaymentTypeRadio> {
  PaymentType selectedRadio = PaymentType.creditCard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: DoubleManager.d_35,
        left: DoubleManager.d_8,
        right: DoubleManager.d_8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pay with
          Text(
            StringsManager.payWith,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontSize: FontsSize.s16),
          ),
          const SizedBox(height: DoubleManager.d_8),
          // Credit card
          PaymentRadioComponent(
            radioType: PaymentType.creditCard,
            selectedRadio: selectedRadio,
            onChanged: (value) => setState(() => selectedRadio = value!),
          ),
          const SizedBox(height: DoubleManager.d_10),

          // Cash
          PaymentRadioComponent(
            radioType: PaymentType.cash,
            selectedRadio: selectedRadio,
            onChanged: (value) => setState(() => selectedRadio = value!),
          ),
        ],
      ),
    );
  }
}

class PaymentRadioComponent extends StatelessWidget {
  const PaymentRadioComponent({
    super.key,
    required this.selectedRadio,
    required this.radioType,
    required this.onChanged,
  });

  final PaymentType selectedRadio, radioType;
  final Function(PaymentType? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.gGrey),
          borderRadius: BorderRadius.circular(DoubleManager.d_12)),
      child: RadioListTile<PaymentType>(
        title: Row(
          children: [
            Icon(
              radioType == PaymentType.creditCard
                  ? Icons.credit_card
                  : Icons.money,
              size: DoubleManager.d_25,
            ),
            const SizedBox(width: DoubleManager.d_20),
            Text(
              radioType.value,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: FontsSize.s14),
            ),
          ],
        ),
        value: radioType,
        groupValue: selectedRadio,
        onChanged: onChanged,
      ),
    );
  }
}
