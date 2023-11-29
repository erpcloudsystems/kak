import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../bloc/meals_bloc.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/error_dialog.dart';
import '../widgets/custom_meals/choices_section.dart';
import '../../../../core/resources/values_manager.dart';
import '../widgets/custom_meals/meal_custom_app_bar.dart';
import '../widgets/custom_meals/description_section.dart';
import '../widgets/custom_meals/custom_bottom_button.dart';
import '../../../../core/utils/loading_indicator_util.dart';

class MealsContentsScreen extends StatefulWidget {
  const MealsContentsScreen({super.key});

  @override
  State<MealsContentsScreen> createState() => _MealsContentsScreenState();
}

class _MealsContentsScreenState extends State<MealsContentsScreen> {
  late ScrollController _scrollController;
  bool isScrolledTo25Percent = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    double maxScroll = DoubleManager.d_25.h;
    double currentScroll = _scrollController.offset;
    setState(() => isScrolledTo25Percent = currentScroll >= maxScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocConsumer<MealsBloc, MealsState>(
          listenWhen: (previous, current) =>
              previous.getMealDetailsState != current.getMealDetailsState,
          listener: (context, state) {
            if (state.getMealDetailsState == RequestState.error) {
              showDialog(
                context: context,
                builder: (BuildContext context) =>
                    ErrorDialog(errorMessage: state.getMealDetailsMessage),
              );
            }
          },
          buildWhen: (previous, current) =>
              previous.getMealDetailsState != current.getMealDetailsState,
          builder: (context, state) {
            if (state.getMealDetailsState == RequestState.loading) {
              return const LoadingIndicatorUtil();
            }
            if (state.getMealDetailsState == RequestState.success) {
              final meal = state.getMealDetailsData;

              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  MealsCustomSliverAppBar(
                      isScrolledTo25Percent: isScrolledTo25Percent, meal: meal),
                  DescriptionSection(meal: meal),
                  ComponentsSection(componentsList: meal.components ?? []),
                  SliverToBoxAdapter(
                    child: SizedBox.fromSize(
                      size: Size.fromHeight(
                        kBottomNavigationBarHeight + DoubleManager.d_5.h,
                      ),
                    ),
                  )
                ],
              );
            }
            return Container();
          },
        ),
        floatingActionButton: const MealCustomBottomButton(total: '175'),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
}
