import 'dart:async';

import 'package:flutter/material.dart';

import 'cart_list_tile_icon.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/colors_manager.dart';

class CartListTileSubtitle extends StatefulWidget {
  const CartListTileSubtitle({
    super.key,
    required this.itemPrice,
    required this.productId,
    required this.quantity,
  });

  final String itemPrice;
  final int productId, quantity;

  @override
  State<CartListTileSubtitle> createState() => _CartListTileSubtitleState();
}

class _CartListTileSubtitleState extends State<CartListTileSubtitle> {
  late ValueNotifier<int> count;
  bool isNegative = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    count = ValueNotifier<int>(widget.quantity);
    timer = Timer(const Duration(seconds: 2), () {});
  }

  @override
  void dispose() {
    super.dispose();
    count.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    count.addListener(() {
      setState(() => isNegative = count.value <= 0);

      // timer.cancel();

      // timer = Timer(const Duration(seconds: 2), () {
      //   BlocProvider.of<CartBloc>(context).add(UpdateCartItemEvent(
      //       postingCartEntity: PostingCartEntity(
      //     productId: widget.productId,
      //     userId: context.read<AuthenticationBloc>().state.signInUserEntity.id,
      //     quantity: count.value,
      //   )));
      // });
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.attach_money,
              color: ColorsManager.swatchRed,
              size: DoubleManager.d_20,
            ),
            Text(
              widget.itemPrice,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: ColorsManager.swatchRed,
                    fontSize: FontsSize.s16,
                  ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CartListTileIcon(
              isNegative: isNegative,
              onTab: () => count.value = count.value - 1,
              icon: Icons.remove,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: DoubleManager.d_10),
              child: ValueListenableBuilder<int>(
                valueListenable: count,
                builder: (context, value, child) => Text(
                  value.toString(),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: ColorsManager.swatchRed,
                        fontSize: FontsSize.s18,
                      ),
                ),
              ),
            ),
            CartListTileIcon(
              isNegative: false,
              onTab: () => count.value = count.value + 1,
              icon: Icons.add,
            )
          ],
        ),
      ],
    );
  }
}
