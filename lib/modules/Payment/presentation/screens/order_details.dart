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

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    ReceivedOrderEntity? receivedOrder;
    return Scaffold(
      appBar: AppBar(title:  Text(StringsManager.orderDetails)),
      body: BlocConsumer<PaymentBloc, PaymentState>(
          listenWhen: (previous, current) =>
              previous.getOrderDetailsState != current.getOrderDetailsState,
          listener: orderDetailsStateHandler,
          buildWhen: (previous, current) =>
              previous.getOrderDetailsData != current.getOrderDetailsData,
          builder: (context, state) {
            final order = state.getOrderDetailsData;
            receivedOrder = order;
            return OrderDetailsSuccessWidget(order: order);
          }),
      floatingActionButton: receivedOrder?.status == DoctypeStatus.completed
          ? ReorderMealBtn(receivedOrder: receivedOrder)
          : null,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final orderId = ModalRoute.of(context)?.settings.arguments as String?;
    final bloc = context.read<PaymentBloc>();
    if (orderId != null) {
      bloc.add(GetOrderDetailsEvent(orderId: orderId));
    }
  }

  void orderDetailsStateHandler(BuildContext context, PaymentState state) {
    switch (state.getOrderDetailsState) {
      case RequestState.loading:
        LoadingUtils.showLoadingDialog(context, LoadingType.circular);
        break;

      case RequestState.success:
        Navigator.of(context).pop();
        break;

      case RequestState.error:
        Navigator.of(context).pop();
        ErrorDialogUtils.displayErrorDialog(
          context: context,
          errorMessage: state.getOrderDetailsMessage,
        );
        break;
      default:
    }
  }
}

class OrderDetailsSuccessWidget extends StatelessWidget {
  const OrderDetailsSuccessWidget({
    super.key,
    required this.order,
  });

  final ReceivedOrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DoubleManager.d_8),
      child: CustomScrollingAnimatedTemplate(children: [
        const SizedBox(height: DoubleManager.d_10),
        // Customer details:
        CustomerDetailsSection(order: order),

        // Items:
        OrderDetailsItemsSection(meals: order.items),

        // Payment summary:
        OrderDetailsPaymentSummary(order: order),

        const SizedBox(height: DoubleManager.d_50)
      ]),
    );
  }
}
