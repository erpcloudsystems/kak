import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../bloc/cart_bloc.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../meals/domain/entities/meal_entity.dart';
import '../../../meals/presentation/widgets/quantity_counter.dart';

class CartListTileSubtitle extends StatefulWidget {
  const CartListTileSubtitle({super.key, required this.meal});

  final MealEntity meal;

  @override
  State<CartListTileSubtitle> createState() => _CartListTileSubtitleState();
}

class _CartListTileSubtitleState extends State<CartListTileSubtitle> {
  late ValueNotifier<int> quantity;
  late Timer timer;

  @override
  Widget build(BuildContext context) {
    calculateNewQuantity(context);
    return Padding(
      padding: const EdgeInsets.only(top: DoubleManager.d_8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // cost
          Text(
            StringsManager.cost(context),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(width: DoubleManager.d_8),

          // Price
          Text(
            widget.meal.price.toString(),
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: ColorsManager.swatchRed,
                ),
          ),
          const Spacer(),

          // Quantity counter
          SizedBox(
            height: DoubleManager.d_35,
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: QuantityCounter(quantity: quantity)),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    quantity = ValueNotifier<int>(widget.meal.quantity ?? IntManager.i_1);
    timer = Timer(const Duration(seconds: 2), () {});
  }

  /// We use this method to listen to quantity changes and update the total price.
  void calculateNewQuantity(BuildContext context) {
    return quantity.addListener(() {
    timer.cancel();

    timer = Timer(const Duration(seconds: 2), () {
      BlocProvider.of<CartBloc>(context).add(UpdateCartItemEvent(
        meal: MealEntity(
          priceAfterDiscount: widget.meal.priceAfterDiscount,
          description: widget.meal.description,
          components: widget.meal.components,
          imageUrl: widget.meal.imageUrl,
          price: widget.meal.price,
          name: widget.meal.name,
          id: widget.meal.id,
          // Updated quantity
          quantity: quantity.value,
        ),
      ));
    });
  });
  }

  @override
  void dispose() {
    super.dispose();
    quantity.dispose();
    timer.cancel();
  }
}
