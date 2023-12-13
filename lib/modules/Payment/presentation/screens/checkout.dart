import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:kak/core/utils/enums.dart';

import '../widgets/checkout/delivery_time.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../Address/presentation/widgets/address/map_snapshot_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mapSnapshot = ModalRoute.of(context)!.settings.arguments as Uint8List;

    return Scaffold(
      backgroundColor: ColorsManager.gWhite,
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // Map snapshot
          MapSnapshotSection(mapSnapshot: mapSnapshot),

          // Delivery time
          const DeliveryTime(deliveryTime: 30),

          // Payment Type
          const PaymentTypeRadio(),
        ]),
      ),
    );
  }
}

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
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: ColorsManager.gGrey),
                borderRadius: BorderRadius.circular(12)),
            child: RadioListTile<PaymentType>(
                title: Row(
                  children: [
                    const Icon(Icons.credit_card, size: 28),
                    const SizedBox(width: 20),
                    Text(PaymentType.creditCard.name),
                  ],
                ),
                value: PaymentType.creditCard,
                groupValue: selectedRadio,
                onChanged: (value) => setState(() => selectedRadio = value!)),
          ),
          RadioListTile<PaymentType>(
            title: Text(PaymentType.cash.name),
            value: PaymentType.cash,
            groupValue: selectedRadio,
            onChanged: (value) {
              setState(() {
                selectedRadio = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
