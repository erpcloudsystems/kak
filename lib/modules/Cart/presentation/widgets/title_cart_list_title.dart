import 'package:flutter/material.dart';

import '../../../../core/resources/values_manager.dart';

class CartListTileTitle extends StatelessWidget {
  const CartListTileTitle({
    super.key,
    required this.title,
    required this.productId,
  });

  final int productId;
  final String title;

  @override
  Widget build(BuildContext context) {
    // final userId =
    //     context.read<AuthenticationBloc>().state.signInUserEntity.id!;
    return Row(
      key: key,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            child: Text(
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: IntManager.i_2,
        )),
        // BlocConsumer<CartBloc, CartState>(
        //   listenWhen: (previous, current) =>
        //       previous.removeCartItemState != current.removeCartItemState,
        //   listener: (context, state) {
        //     if (state.removeCartItemState == RequestState.loading) {
        //       CustomDialogs.showLoadingDialog(context, StringsManager.deleting);
        //     }

        //     if (state.removeCartItemState == RequestState.success) {
        //       Navigator.of(context).pop();
        //       context.read<CartBloc>().add(GetCartItemsEvent(userId: userId));
        //     }

        //     if (state.removeCartItemState == RequestState.error) {
        //       Navigator.of(context).pop();
        //       context.read<CartBloc>().add(const EraseCartItemEvent());
        //       context.read<CartBloc>().add(GetCartItemsEvent(userId: userId));
        //       SnackBarUtil().getSnackBar(
        //         message: state.removeCartItemMessage,
        //         context: context,
        //         color: Colors.red,
        //       );
        //     }
        //   },
        //   buildWhen: (previous, current) =>
        //       previous.removeCartItemState != current.removeCartItemState,
        //   key: key,
        //   builder: (context, state) {
        // return
        IconButton(
            onPressed: () {},
            // BlocProvider.of<CartBloc>(context).add(RemoveCartItemEvent(
            //     postingCartEntity: PostingCartEntity(
            //   productId: productId,
            //   userId: userId,
            // ))),
            icon: const Icon(
              Icons.delete_forever_outlined,
              size: DoubleManager.d_25,
              color: Colors.red,
            ))
        // },
        // ),
      ],
    );
  }
}
