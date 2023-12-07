import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../bloc/meals_bloc.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/no_data.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/resources/assetss_path.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/custom_animated_grid.dart';

class MealGroupItemsScreen extends StatelessWidget {
  const MealGroupItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String groupName =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(groupName),
      ),
      body: BlocBuilder<MealsBloc, MealsState>(
        buildWhen: (previous, current) =>
            previous.getMealGroupItemsState != current.getMealGroupItemsState ||
            previous.getMealGroupItemsData != current.getMealGroupItemsData,
        builder: (context, state) {
          if (state.getMealGroupItemsState == RequestState.error) {
            return const Center(
                child: NoDataWidget(
              assetPath: ImagesPath.errorPath,
              text: StringsManager.errorMessage,
            ));
          }
          if (state.getMealGroupItemsState == RequestState.success) {
            return CustomAnimatedGrid(items: state.getMealGroupItemsData);
          }

          return Container();
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: DoubleManager.d_30),
        child: FloatingActionButton(
          backgroundColor: ColorsManager.swatchRed,
          foregroundColor: ColorsManager.gWhite,
          shape: const CircleBorder(),
          onPressed: () =>
              Navigator.of(context).pushNamed(Routes.cartScreenKey),
          child: const Icon(Icons.shopping_cart_outlined),
        ),
      ),
    );
  }
}
