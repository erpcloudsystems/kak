import 'dart:async';

import 'package:flutter/material.dart';

import 'cart_list_tile_icon.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../meals/domain/entities/meal_entity.dart';

class CartListTileSubtitle extends StatefulWidget {
  const CartListTileSubtitle({super.key, required this.meal});

  final MealEntity meal;

  @override
  State<CartListTileSubtitle> createState() => _CartListTileSubtitleState();
}

class _CartListTileSubtitleState extends State<CartListTileSubtitle> {
  // late ValueNotifier<int> count;
  // late ValueNotifier<double> mealRealPrice;
  // bool isNegative = false;
  // late Timer timer;
  // late double mealBasePrice;

  @override
  void initState() {
    super.initState();
    // count = ValueNotifier<int>(widget.meal.quantity!);
    // mealRealPrice = ValueNotifier<double>(widget.meal.price);
    // timer = Timer(const Duration(seconds: 2), () {});
    // mealBasePrice = widget.meal.price;
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   count.dispose();
  //   timer.cancel();
  // }

  @override
  Widget build(BuildContext context) {
    // count.addListener(() {
    //   setState(() => isNegative = count.value <= 1);

    //   // timer.cancel();

    //   // timer = Timer(const Duration(seconds: 2), () {
    //   //   BlocProvider.of<CartBloc>(context).add(UpdateCartItemEvent(
    //   //       postingCartEntity: PostingCartEntity(
    //   //     productId: widget.productId,
    //   //     userId: context.read<AuthenticationBloc>().state.signInUserEntity.id,
    //   //     quantity: count.value,
    //   //   )));
    //   // });
    // });
    return
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('COST: ', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(width: DoubleManager.d_8),
          Row(
            children: [
              // const Icon(
              //   Icons.attach_money,
              //   color: ColorsManager.swatchRed,
              //   size: DoubleManager.d_20,
              // ),
              Text(
                widget.meal.price.toString(),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: ColorsManager.swatchRed,
                      // fontSize: FontsSize.s16,
                    ),
              ),
            ],
          ),
          //   ],
          // ),
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     CartListTileIcon(
          //       isNegative: isNegative,
          //       onTab: () {
          //         count.value = count.value - 1;
          //         mealRealPrice.value = count.value * mealBasePrice;
          //       },
          //       icon: Icons.remove,
          //     ),
          //     Padding(
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: DoubleManager.d_10),
          //       child: ValueListenableBuilder<int>(
          //         valueListenable: count,
          //         builder: (context, value, child) => Text(
          //           value.toString(),
          //           style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //                 color: ColorsManager.swatchRed,
          //                 fontSize: FontsSize.s18,
          //               ),
          //         ),
          //       ),
          //     ),
          //     CartListTileIcon(
          //       isNegative: false,
          //       onTab: () {
          //         count.value = count.value + 1;
          //         mealRealPrice.value = count.value * mealBasePrice;
          //       },
          //       icon: Icons.add,
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
