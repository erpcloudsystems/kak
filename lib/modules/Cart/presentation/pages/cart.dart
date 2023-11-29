import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kak/core/utils/no_data.dart';

import '../../../../core/utils/enums.dart';
import '../bloc/cart_bloc.dart';
import '../widgets/cart_list.dart';
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
                // cartItems: state.getCartItemsData.items));
                // }
                // }),
              },
            ),
            const CreateOrderSection(),
          ],
        ));
  }
}

// const CartItemEntity testCart = CartItemEntity(
//   allQuantityPrice: 200,
//   productImage:
//       'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fried-chicken-promo-design-template-77d37eb3a58ba753f502774abd21dbae_screen.jpg?ts=1655303745',
//   productName: 'Family Meal',
//   productId: 1,
//   itemPrice: 275,
//   quantity: 2,
// );
// final List<CartItemEntity> dummyList = [
//   testCart,
//   testCart,
//   testCart,
//   testCart,
//   testCart,
// ];
