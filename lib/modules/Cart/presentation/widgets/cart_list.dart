import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sizer/sizer.dart';

import 'cart_card.dart';
import 'cart_list_tile_image.dart';
import 'title_cart_list_title.dart';
import 'subtile_cart_list_tile.dart';
import '../../../../core/resources/values_manager.dart';
import '../../domain/entities/returning_cart_item.dart';

class CartList extends StatelessWidget {
  const CartList({super.key, required this.cartItems});

  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 1000),
            child: SlideAnimation(
              verticalOffset: 90.h,
              curve: Curves.decelerate,
              child: FadeInAnimation(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) => CartCard(
                    key: ValueKey(cartItems[index].productId),
                    child: ListTile(
                      tileColor: Colors.white,
                      contentPadding: const EdgeInsets.all(DoubleManager.d_8),
                      leading: CartListTileImage(
                          imageUrl: cartItems[index].productImage),
                      title: CartListTileTitle(
                        key: UniqueKey(),
                        title: cartItems[index].productName,
                        productId: cartItems[index].productId,
                      ),
                      subtitle: CartListTileSubtitle(
                        productId: cartItems[index].productId,
                        itemPrice: cartItems[index].itemPrice.toString(),
                        quantity: cartItems[index].quantity,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
