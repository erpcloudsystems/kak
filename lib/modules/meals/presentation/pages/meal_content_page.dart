import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:kak/core/global/global_varibles.dart';
import 'package:kak/core/utils/snack_bar_util.dart';
import 'package:kak/modules/Cart/presentation/bloc/cart_bloc.dart';
import 'package:kak/modules/meals/domain/entities/meal_component.dart';
import 'package:kak/modules/meals/domain/entities/meal_entity.dart';
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
  final _formKey = GlobalKey<FormState>();
  bool isScrolledTo25Percent = false;
  MealEntity? theMeal;

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
              theMeal = meal;

              return Form(
                key: _formKey,
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    MealsCustomSliverAppBar(
                        isScrolledTo25Percent: isScrolledTo25Percent,
                        meal: meal),
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
                ),
              );
            }
            return Container();
          },
        ),
        floatingActionButton: BlocListener<CartBloc, CartState>(
          listenWhen: (previous, current) =>
              previous.addCartItemState != current.addCartItemState,
          listener: (context, state) {
            if (state.addCartItemState == RequestState.success) {
              SnackBarUtil().getSnackBar(
                  context: context,
                  message: state.addCartItemMessage,
                  color: Colors.green);
            }

            if (state.addCartItemState == RequestState.error) {
              SnackBarUtil().getSnackBar(
                context: context,
                message: state.addCartItemMessage,
                color: Colors.red,
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
                    price: theMeal!.price,
                    name: theMeal!.name,
                    id: theMeal!.id,
                    components:
                        List<MealComponentEntity>.from(gv.getChosenList),
                    quantity: 1,
                  );
                  BlocProvider.of<CartBloc>(context)
                      .add(AddCartItemEvent(meal: meal));
                  gv.clearChosenList();
                }
              }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
}
