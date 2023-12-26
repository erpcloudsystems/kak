import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/payment_bloc.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/error_dialog.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/custom_floating_button.dart';
import '../../../../core/utils/loading_indicator_util.dart';
import '../widgets/order_details/customer_details_section.dart';
import '../widgets/order_details/order_details_items_section.dart';
import '../widgets/order_details/order_details_payment_summary.dart';
import '../../../../core/utils/custom_scrolling_animated_template.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(StringsManager.orderDetails)),
      body: BlocConsumer<PaymentBloc, PaymentState>(
          listenWhen: (previous, current) =>
              previous.getOrderDetailsState != current.getOrderDetailsState,
          listener: (context, state) {
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
          },
          buildWhen: (previous, current) =>
              previous.getOrderDetailsData != current.getOrderDetailsData,
          builder: (context, state) {
            final order = state.getOrderDetailsData;
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
      floatingActionButton: CustomFloatingButton(
        title: StringsManager.reorder,
        onPressed: () {},
      ),
    );
  }
}