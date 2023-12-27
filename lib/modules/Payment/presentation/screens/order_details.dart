import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../bloc/payment_bloc.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/error_dialog.dart';
import '../../../../core/resources/values_manager.dart';
import '../widgets/order_details/reorder_meal_btn.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../domain/entities/received_order_entity.dart';
import '../../../../core/utils/loading_indicator_util.dart';
import '../widgets/order_details/customer_details_section.dart';
import '../widgets/order_details/order_details_items_section.dart';
import '../widgets/order_details/order_details_payment_summary.dart';
import '../../../../core/utils/custom_scrolling_animated_template.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ReceivedOrderEntity? receivedOrder;
    return Scaffold(
      appBar: AppBar(title: const Text(StringsManager.orderDetails)),
      body: BlocConsumer<PaymentBloc, PaymentState>(
          listenWhen: (previous, current) =>
              previous.getOrderDetailsState != current.getOrderDetailsState,
          listener: orderDetailsStateHandler,
          buildWhen: (previous, current) =>
              previous.getOrderDetailsData != current.getOrderDetailsData,
          builder: (context, state) {
            final order = state.getOrderDetailsData;
            receivedOrder = order;
            return Padding(
              padding: const EdgeInsets.all(DoubleManager.d_8),
              child: CustomScrollingAnimatedTemplate(children: [
                // Customer details:
                CustomerDetailsSection(order: order),

                // Items:
                OrderDetailsItemsSection(meals: order.items),

                // Payment summary:
                OrderDetailsPaymentSummary(order: order),

                const SizedBox(height: DoubleManager.d_50)
              ]),
            );
          }),
      floatingActionButton: ReorderMealBtn(receivedOrder: receivedOrder),
    );
  }

  void orderDetailsStateHandler(BuildContext context, PaymentState state) {
    switch (state.getOrderDetailsState) {
      case RequestState.loading:
        LoadingUtils.showLoadingDialog(context, LoadingType.circular);
        break;

      case RequestState.success:
        break;

      case RequestState.error:
        ErrorDialogUtils.displayErrorDialog(
          context: context,
          errorMessage: state.getOrderDetailsMessage,
        );
        break;
      default:
    }
  }
}
