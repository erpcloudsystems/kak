import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'checkout_card.dart';
import '../bloc/cart_bloc.dart';
import '../../../../core/resources/values_manager.dart';

class CreateOrderSection extends StatelessWidget {
  const CreateOrderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Flexible(
        flex: IntManager.i_1,
        //   child: BlocConsumer<OrdersBloc, OrdersState>(
        //     listenWhen: (previous, current) =>
        //         previous.createOrderState != current.createOrderState,
        //     listener: (context, state) {
        //       if (state.createOrderState == RequestState.error) {
        //         SnackBarUtil().getSnackBar(
        //           context: context,
        //           message: state.createOrderMessage,
        //           color: Colors.red,
        //         );
        //       }
        //       if (state.createOrderState == RequestState.success) {
        //         Navigator.of(context).pushNamed(Routes.ordersScreenKey);
        //       }
        //     },
        //     buildWhen: (previous, current) =>
        //         previous.createOrderState != current.createOrderState,
        //     builder: (context, state) {
        //       if (state.createOrderState == RequestState.loading) {
        //         return const SizedBox(
        //           height: DoubleManager.d_5,
        //           child:
        //               LinearProgressIndicator(backgroundColor: Colors.transparent),
        //         );
        //       }
        //       return
        child: CreateOrderButton());
    // },
    // ),
    // );
  }
}

class CreateOrderButton extends StatelessWidget {
  const CreateOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TotalCard(
      // TODO: Add place an order event.
      checkoutFunction: () {},
      total: context.watch<CartBloc>().state.totalPrice.toString(),
    );
  }
}
