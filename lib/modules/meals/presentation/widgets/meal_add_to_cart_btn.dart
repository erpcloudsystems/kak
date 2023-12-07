import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/meal_entity.dart';
import 'contents_widgets/custom_bottom_button.dart';
import '../../../Cart/presentation/bloc/cart_bloc.dart';

class MealAddToCartBut extends StatelessWidget {
  const MealAddToCartBut({
    super.key,
    required this.quantity,
    required this.meal,
  });

  final ValueNotifier<int> quantity;
  final MealEntity meal;

  @override
  Widget build(BuildContext context) {
    return MealCustomBottomButton(
        total: context.watch<CartBloc>().state.totalPrice.toString(),
        onPressed: () {
          BlocProvider.of<CartBloc>(context).add(AddCartItemEvent(
              meal: MealEntity(
            description: meal.description,
            imageUrl: meal.imageUrl,
            price: meal.priceAfterDiscount!,
            name: meal.name,
            id: const Uuid().v4(),
            quantity: quantity.value,
            components: const [],
          )));
        });
  }
}
