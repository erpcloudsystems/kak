import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'checkout_card.dart';
import '../bloc/cart_bloc.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../Address/presentation/bloc/address/address_bloc.dart';

class CreateOrderSection extends StatelessWidget {
  const CreateOrderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Flexible(flex: IntManager.i_1, child: CreateOrderButton());
  }
}

class CreateOrderButton extends StatelessWidget {
  const CreateOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressBloc, AddressState>(
      listenWhen: (previous, current) =>
          previous.getAllAddressesState != current.deleteAddressState,
      listener: (context, state) {
        state.getAllAddressesData.isEmpty
            ? Navigator.of(context).pushNamed(Routes.mapScreenKey)
            : Navigator.of(context).pushNamed(Routes.allAddressesScreenKey);
      },
      child: TotalCard(
        checkoutFunction: () =>
            context.read<AddressBloc>().add(GetAllAddressesEvent()),
        total: context.watch<CartBloc>().state.totalPrice.toString(),
      ),
    );
  }
}
