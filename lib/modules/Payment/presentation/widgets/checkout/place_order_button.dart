import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../bloc/payment_bloc.dart';
import '../../../domain/entities/order.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/general_button.dart';
import '../../../../Cart/presentation/bloc/cart_bloc.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../Address/presentation/bloc/address/address_bloc.dart';

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton({super.key, required this.paymentType});

  final ValueNotifier<PaymentType> paymentType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: DoubleManager.d_8,
        right: DoubleManager.d_8,
        bottom: DoubleManager.d_15,
      ),
      child: ColoredElevatedButton(
        onPressed: () {
          context.read<PaymentBloc>().add(CreateOrderEvent(
                order: OrderEntity(
                  customerAddress:
                      context.read<AddressBloc>().state.userAddressId,
                  modeOfPayment: paymentType.value,
                  items: context.read<CartBloc>().state.getCartItemsData,
                ),
              ));
        },
        buttonText: StringsManager.placeOrder,
      ),
    );
  }
}
