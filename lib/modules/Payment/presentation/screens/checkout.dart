import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../widgets/checkout/delivery_time.dart';
import '../widgets/checkout/price_summary.dart';
import '../widgets/checkout/payment_type_radio.dart';
import '../widgets/checkout/place_order_button.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../Address/presentation/widgets/address/map_snapshot_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mapSnapshot = ModalRoute.of(context)!.settings.arguments as Uint8List;

    return Scaffold(
      backgroundColor: ColorsManager.gWhite,
      appBar: AppBar(
        title: const Text(StringsManager.checkout),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // Map snapshot
          MapSnapshotSection(mapSnapshot: mapSnapshot),

          // Delivery time
          const DeliveryTime(deliveryTime: 30),

          // Payment Type
          const PaymentTypeRadio(),

          // Price summary
          const PriceSummary(),

          // Button
          const PlaceOrderButton(),
        ]),
      ),
    );
  }
}
