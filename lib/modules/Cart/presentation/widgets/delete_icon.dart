import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../bloc/cart_bloc.dart';
import '../../../../core/utils/awsom_dialogs.dart';
import '../../../../core/resources/assetss_path.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../meals/domain/entities/meal_entity.dart';

class CartItemDeleteIcon extends StatelessWidget {
  const CartItemDeleteIcon({super.key, required this.meal});

  final MealEntity meal;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.only(top: DoubleManager.d_25),
      onPressed: () {
        AwesomeDialogUtils.showConfirmDialog(
          context: context,
          asset: ImagesPath.deletePath,
          onConfirm: () {
            BlocProvider.of<CartBloc>(context)
                .add(RemoveCartItemEvent(meal: meal));
            Navigator.of(context).pop();
          },
          onCancel: () => Navigator.of(context).pop(),
          confirmMessage: StringsManager.deleteItemMessage,
        );
      },
      icon: const Icon(
        Icons.delete_forever_outlined,
        size: DoubleManager.d_25,
        color: ColorsManager.gRed,
      ),
    );
  }
}
