import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'cart_card.dart';
import 'cart_list_tile_image.dart';
import 'title_cart_list_title.dart';
import 'subtile_cart_list_tile.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../meals/domain/entities/meal_entity.dart';

class CartList extends StatelessWidget {
  const CartList({super.key, required this.cartItems});

  final List<MealEntity> cartItems;

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
              verticalOffset: DoubleManager.d_90.h,
              curve: Curves.decelerate,
              child: FadeInAnimation(
                child: CartCard(
                  key: ValueKey(cartItems[index].hashCode),
                  child: ListTile(
                    tileColor: Colors.white,
                    contentPadding: const EdgeInsets.all(DoubleManager.d_8),
                    leading:
                        CartListTileImage(imageUrl: cartItems[index].imageUrl),
                    title: CartListTileTitle(
                      key: UniqueKey(),
                      meal: cartItems[index],
                    ),
                    subtitle: CartListTileSubtitle(
                      productId: cartItems[index].hashCode,
                      itemPrice: cartItems[index].price.toString(),
                      quantity: cartItems[index].quantity!,
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
