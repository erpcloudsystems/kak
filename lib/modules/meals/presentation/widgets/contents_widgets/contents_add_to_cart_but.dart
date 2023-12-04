import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'custom_bottom_button.dart';
import '../../../../../core/utils/enums.dart';
import '../../../domain/entities/meal_entity.dart';
import '../../../domain/entities/meal_component.dart';
import '../../../../../core/utils/snack_bar_util.dart';
import '../../../../../core/global/global_varibles.dart';
import '../../../../Cart/presentation/bloc/cart_bloc.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/strings_manager.dart';

class ContentMealAddToCartBut extends StatelessWidget {
  const ContentMealAddToCartBut({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.theMeal,
    required this.quantity,
    required this.price,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final ValueNotifier<int> quantity;
  final ValueNotifier<double> price;
  final MealEntity? theMeal;

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
              color: ColorsManager.gGreen);
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
          total: '175',
          onPressed: () {
            if (_formKey.currentState?.validate() == true) {
              final gv = GlobalVariables();
              final meal = MealEntity(
                description: theMeal!.description,
                imageUrl: theMeal!.imageUrl,
                price: price.value,
                name: theMeal!.name,
                id: theMeal!.id,
                components: List<MealComponentEntity>.from(gv.getChosenList),
                quantity: quantity.value,
              );
              BlocProvider.of<CartBloc>(context)
                  .add(AddCartItemEvent(meal: meal));
              gv.clearChosenList();
            } else {
              SnackBarUtil().getSnackBar(
                context: context,
                message: StringsManager.completeMealMessage,
                color: ColorsManager.gRed,
              );
            }
          }),
    );
  }
}
