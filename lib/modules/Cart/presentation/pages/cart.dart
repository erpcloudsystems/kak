import 'package:flutter/material.dart';
import 'package:kak/modules/Cart/domain/entities/returning_cart_item.dart';

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
  // @override
  // void initState() {
  //   super.initState();
  //   BlocProvider.of<CartBloc>(context).add(GetCartItemsEvent(
  //     userId: BlocProvider.of<AuthenticationBloc>(context)
  //         .state
  //         .signInUserEntity
  //         .id!,
  //   ));
  // }

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
            // BlocConsumer<CartBloc, CartState>(
            // listenWhen: (previous, current) =>
            //     previous.getCartItemsState != current.getCartItemsState,
            // listener: (context, state) {
            //   if (state.getCartItemsState == RequestState.error) {
            //     SnackBarUtil().getSnackBar(
            //         context: context,
            //         message: state.getCartItemsMessage,
            //         color: Colors.red);
            //   }
            // },
            // buildWhen: (previous, current) =>
            //     previous.getCartItemsState != current.getCartItemsState ||
            //     previous.getCartItemsData.items !=
            //         current.getCartItemsData.items,
            // builder: (context, state) {
            //   switch (state.getCartItemsState) {
            //     case RequestState.loading:
            //       return const CustomLoadingWithImage();

            //     case RequestState.error:
            //       return const NoDataWidget();

            // default:
            // return
            Flexible(
                flex: IntManager.i_5, child: CartList(cartItems: dummyList)),
            // cartItems: state.getCartItemsData.items));
            // }
            // }),
            const CreateOrderSection(),
          ],
        ));
  }
}

const CartItemEntity testCart = CartItemEntity(
  allQuantityPrice: 200,
  productImage:
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fried-chicken-promo-design-template-77d37eb3a58ba753f502774abd21dbae_screen.jpg?ts=1655303745',
  productName: 'Family Meal',
  productId: 1,
  itemPrice: 275,
  quantity: 2,
);
final List<CartItemEntity> dummyList = [
  testCart,
  testCart,
  testCart,
  testCart,
  testCart,
];
