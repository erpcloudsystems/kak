import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/payment_bloc.dart';
import '../../../../core/utils/enums.dart';
import '../widgets/checkout/delivery_time.dart';
import '../widgets/checkout/price_summary.dart';
import '../../../../core/utils/snack_bar_util.dart';
import '../widgets/checkout/payment_type_radio.dart';
import '../widgets/checkout/place_order_button.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/loading_indicator_util.dart';
import '../../../Address/presentation/widgets/address/map_snapshot_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mapSnapshot = ModalRoute.of(context)!.settings.arguments as Uint8List;
    final paymentType = ValueNotifier<PaymentType>(PaymentType.cash);

    return Scaffold(
      backgroundColor: ColorsManager.gWhite,
      appBar: AppBar(
        title: const Text(StringsManager.checkout),
      ),
      body: BlocListener<PaymentBloc, PaymentState>(
        listenWhen: (previous, current) =>
            previous.createOrderState != current.createOrderState,
        listener: (context, state) {
          switch (state.createOrderState) {
            case RequestState.loading:
              LoadingUtils.showLoadingDialog(
                context,
                LoadingType.linear,
                StringsManager.createOrderMessage,
              );
              break;
            case RequestState.error:
              Navigator.of(context).pop();
              SnackBarUtil().getSnackBar(
                context: context,
                message: state.createOrderMessage,
                color: ColorsManager.gRed,
              );
            case RequestState.success:
              Navigator.of(context).pop();
              SnackBarUtil().getSnackBar(
                context: context,
                color: ColorsManager.gGreen,
                message: StringsManager.orderCreated,
              );

            default:
          }
        },
        child: SingleChildScrollView(
          child: Column(children: [
            // Map snapshot
            MapSnapshotSection(mapSnapshot: mapSnapshot),

            // Delivery time
            const DeliveryTime(deliveryTime: 30),

            // Payment Type
            PaymentTypeRadio(paymentType: paymentType),

            // Price summary
            const PriceSummary(),

            // Button
            PlaceOrderButton(paymentType: paymentType),
          ]),
        ),
      ),
    );
  }
}
