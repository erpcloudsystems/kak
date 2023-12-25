import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/enums.dart';
import '../widgets/orders/orders_list_card.dart';
import '../../../../core/utils/error_dialog.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/loading_indicator_util.dart';
import '../../../Payment/presentation/bloc/payment_bloc.dart';
import '../../../Payment/domain/entities/orders_list_item.dart';
import '../../../../core/utils/custom_scrolling_animated_template.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringsManager.previousOrders),
      ),
      body: BlocConsumer<PaymentBloc, PaymentState>(
        listenWhen: (previous, current) =>
            previous.getOrdersListState != current.getOrdersListState,
        listener: getOrdersStateHandler,
        buildWhen: (previous, current) =>
            previous.getOrdersListState != current.getOrdersListState,
        builder: (context, state) {
          if (state.getOrdersListState == RequestState.success) {
            return OrdersList(items: state.getOrdersListData);
          }
          return const SizedBox();
        },
      ),
    );
  }

  void getOrdersStateHandler(context, state) {
        switch (state.getOrdersListState) {
          case RequestState.loading:
            LoadingUtils.showLoadingDialog(context, LoadingType.circular);
            break;
  
          case RequestState.error:
            ErrorDialogUtils.displayErrorDialog(
                context: context, errorMessage: state.getOrdersListMessage);
            break;
  
          default:
        }
      }
}

class OrdersList extends StatelessWidget {
  const OrdersList({super.key, required this.items});

  final List<OrdersListItem> items;

  @override
  Widget build(BuildContext context) {
    return CustomScrollingAnimatedTemplate(children: [
      ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) => OrdersListCard(item: items[index]),
      ),
    ]);
  }
}
