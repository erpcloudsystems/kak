import 'package:flutter/material.dart';

import '../../../../core/resources/values_manager.dart';
import 'checkout_card.dart';

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
    // final user = context.read<AuthenticationBloc>().state.signInUserEntity;
    return TotalCard(
        checkoutFunction: () {},
        // {
        //   BlocProvider.of<OrdersBloc>(context).add(CreateOrderEvent(
        //       order: PostingOrderEntity(
        //     status: 'pending',
        //     currency: 'EGP',
        //     customerNote: 'No Notes',
        //     billing: BillingEntity(
        //       firstName: user.firstName,
        //       lastName: user.lastName,
        //       address1: user.address,
        //       address2: user.address,
        //       city: user.city,
        //       state: user.city,
        //       postcode: 'postcode',
        //       country: user.country,
        //       email: user.email,
        //       phone: user.phoneNumber.toString(),
        //     ),
        //     shipping: ShippingEntity(
        //       firstName: user.firstName,
        //       lastName: user.lastName,
        //       address1: user.address,
        //       address2: user.address,
        //       city: user.city,
        //       state: user.city,
        //       postcode: 'postcode',
        //       country: user.country,
        //     ),
        //     customerId: user.id,
        //     paymentMethod: 'Cash',
        //     paymentMethodTitle: 'Cash',
        //     setPaid: false,
        //     lineItems: context.read<CartBloc>().state.getCartItemsData.items,
        //   )));
        // },
        total: '275'
        // context.watch<CartBloc>().state.getCartItemsData.total.toString(),
        );
  }
}
