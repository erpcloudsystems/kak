import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../bloc/cart_bloc.dart';
import '../widgets/cart_list.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/no_data.dart';
import '../widgets/create_order_button.dart';
import '../../../../core/utils/snack_bar_util.dart';
import '../../../../core/resources/assetss_path.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/loading_indicator_util.dart';

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
            StringsManager.cart(context),
            style: Theme.of(context)
                .appBarTheme
                .titleTextStyle!
                .copyWith(fontSize: FontsSize.s20),
          ),
        ),
        body: BlocConsumer<CartBloc, CartState>(
          listenWhen: (previous, current) =>
              previous.removeCartItemState != current.removeCartItemState,
          listener: (context, state) {
            if (state.removeCartItemState == RequestState.loading) {
              LoadingUtils.showLoadingDialog(context, LoadingType.linear,
                  StringsManager.deleting(context));
            }

            if (state.removeCartItemState == RequestState.success) {
              Navigator.of(context).pop();
              BlocProvider.of<CartBloc>(context).add(GetCartItemsEvent());
              SnackBarUtil().getSnackBar(
                message: state.removeCartItemMessage,
                context: context,
                color: ColorsManager.gGreen,
              );
            }

            if (state.removeCartItemState == RequestState.error) {
              Navigator.of(context).pop();
              SnackBarUtil().getSnackBar(
                message: state.removeCartItemMessage,
                context: context,
                color: ColorsManager.gRed,
              );
            }
          },
          buildWhen: (previous, current) =>
              previous.getCartItemsState != current.getCartItemsState ||
              previous.getCartItemsData != current.getCartItemsData,
          builder: (context, state) {
            if (state.getCartItemsState == RequestState.error ||
                state.getCartItemsData.isEmpty) {
              return  NoDataWidget(
                assetPath: ImagesPath.emptyCartPath,
                text: StringsManager.noCartItemsMessage(context),
              );
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: IntManager.i_5,
                    child: CartList(cartItems: state.getCartItemsData)),
                const CreateOrderSection(),
              ],
            );
          },
        ));
  }
}
