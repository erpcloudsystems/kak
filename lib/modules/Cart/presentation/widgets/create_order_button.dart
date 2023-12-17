import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/routes.dart';
import 'checkout_card.dart';
import '../bloc/cart_bloc.dart';
import '../../../../core/resources/values_manager.dart';

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
    return TotalCard(
      checkoutFunction: () =>
          Navigator.of(context).pushNamed(Routes.mapScreenKey),
      total: context.watch<CartBloc>().state.totalPrice.toString(),
    );
  }
}
