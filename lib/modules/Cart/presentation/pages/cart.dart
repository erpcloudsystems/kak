import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../bloc/cart_bloc.dart';
import '../widgets/cart_list.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/no_data.dart';
import '../widgets/create_order_button.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CartBloc>(context).add(GetCartItemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            StringsManager.cart,
            style: Theme.of(context)
                .appBarTheme
                .titleTextStyle!
                .copyWith(fontSize: FontsSize.s20),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<CartBloc, CartState>(
              buildWhen: (previous, current) =>
                  previous.getCartItemsState != current.getCartItemsState ||
                  previous.getCartItemsData != current.getCartItemsData,
              builder: (context, state) {
                if (state.getCartItemsState == RequestState.error) {
                  return const NoDataWidget();
                }

                return Flexible(
                    flex: IntManager.i_5,
                    child: CartList(cartItems: state.getCartItemsData));
              },
            ),
            const CreateOrderSection(),
          ],
        ));
  }
}