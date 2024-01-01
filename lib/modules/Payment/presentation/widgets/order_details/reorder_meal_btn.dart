import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../../core/resources/routes.dart';
import '../../../../../core/utils/snack_bar_util.dart';
import '../../../../Cart/presentation/bloc/cart_bloc.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../meals/domain/entities/meal_entity.dart';
import '../../../domain/entities/received_order_entity.dart';
import '../../../../meals/domain/entities/meal_component.dart';
import '../../../../../core/utils/custom_floating_button.dart';

class ReorderMealBtn extends StatelessWidget {
  const ReorderMealBtn({super.key, required this.receivedOrder});

  final ReceivedOrderEntity? receivedOrder;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.addCartItemState != current.addCartItemState,
      listener: reorderBtnStateHandler,
      child: CustomFloatingButton(
        title: StringsManager.reorder(context),
        onPressed: () {
          context.read<CartBloc>().add(
                AddCartItemEvent(
                  meal: MealEntity(
                    description: '',
                    imageUrl: '',
                    id: const Uuid().v1(),
                    name: StringsManager.reorderedMeal(context),
                    price: receivedOrder!.price,
                    components: receivedOrder!.items
                        .map(
                          (e) => MealComponentEntity(
                            itemClassification: '',
                            componentType: ComponentType.optional,
                            maxRequired: 1,
                            quantity: e.quantity ?? 1,
                            itemName: e.name,
                            image: e.imageUrl,
                            price: e.price,
                          ),
                        )
                        .toList(),
                    quantity: 1,
                  ),
                ),
              );
          Navigator.of(context).pushNamed(Routes.cartScreenKey);
        },
      ),
    );
  }

  void reorderBtnStateHandler(BuildContext context, CartState state) {
    switch (state.addCartItemState) {
      case RequestState.success:
        SnackBarUtil().getSnackBar(
          context: context,
          message: StringsManager.cartAddedMessage(context),
          color: ColorsManager.gGreen,
        );
        break;

      case RequestState.error:
        SnackBarUtil().getSnackBar(
          context: context,
          message: state.addCartItemMessage,
          color: ColorsManager.gRed,
        );
        break;
      default:
    }
  }
}
