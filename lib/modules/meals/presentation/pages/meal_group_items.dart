import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../bloc/meals_bloc.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/no_data.dart';
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
            return const Center(child: NoDataWidget());
          }
          if (state.getMealGroupItemsState == RequestState.success) {
            return CustomAnimatedGrid(items: state.getMealGroupItemsData);
          }

          return Container();
        },
      ),
    );
  }
}
