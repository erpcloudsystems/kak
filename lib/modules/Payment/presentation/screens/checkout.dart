import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../bloc/payment_bloc.dart';
import '../../../../core/utils/enums.dart';
import '../widgets/checkout/delivery_time.dart';
import '../widgets/checkout/price_summary.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/utils/snack_bar_util.dart';
import '../widgets/checkout/payment_type_radio.dart';
import '../widgets/checkout/place_order_button.dart';
import '../../../Address/domain/entities/address.dart';
import '../../../Cart/presentation/bloc/cart_bloc.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/loading_indicator_util.dart';
import '../../../Address/presentation/widgets/create_address/map_snapshot_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentType = ValueNotifier<PaymentType>(PaymentType.cash);
    final address = ModalRoute.of(context)!.settings.arguments as AddressEntity;

    return Scaffold(
      backgroundColor: ColorsManager.gWhite,
      appBar: AppBar(
        title:  Text(StringsManager.checkout(context)),
      ),
      body: BlocListener<PaymentBloc, PaymentState>(
        listenWhen: (previous, current) =>
            previous.createOrderState != current.createOrderState,
        listener: checkoutScreenStateHandler,
        child: SingleChildScrollView(
          child: Column(children: [
            // Map snapshot
            MapSnapshotSection(
              latitude: address.latitude!,
              longitude: address.longitude!,
              fullAddress: address.googleAddress!,
            ),

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

  void checkoutScreenStateHandler(BuildContext context, PaymentState state) {
    switch (state.createOrderState) {
      case RequestState.loading:
        LoadingUtils.showLoadingDialog(
          context,
          LoadingType.linear,
          StringsManager.createOrderMessage(context),
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
        context.read<CartBloc>().add(EraseCartItemEvent());
        Navigator.of(context).pop();
        SnackBarUtil().getSnackBar(
          context: context,
          color: ColorsManager.gGreen,
          message: StringsManager.orderCreated(context),
        );
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.myOrdersScreenKey,
          (route) => route.settings.name == Routes.navigationBarScreenKey,
        );
      default:
    }
  }
}
