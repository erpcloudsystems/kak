
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/snack_bar_util.dart';
import '../../../Cart/presentation/bloc/cart_bloc.dart';
import '../../domain/entities/meal_entity.dart';
import 'contents_widgets/custom_bottom_button.dart';

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
    return BlocListener<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.addCartItemState != current.addCartItemState,
      listener: (context, state) {
        if (state.addCartItemState == RequestState.success) {
          SnackBarUtil().getSnackBar(
            context: context,
            message: state.addCartItemMessage,
            color: ColorsManager.gGreen,
          );
          Navigator.of(context).pushNamed(Routes.cartScreenKey);
        }

        if (state.addCartItemState == RequestState.error) {
          SnackBarUtil().getSnackBar(
            context: context,
            message: state.addCartItemMessage,
            color: ColorsManager.gRed,
          );
        }
      },
      child: MealCustomBottomButton(
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
            )));
          }),
    );
  }
}
