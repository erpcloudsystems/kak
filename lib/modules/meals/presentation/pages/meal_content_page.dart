import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:kak/core/global/global_varibles.dart';
import 'package:sizer/sizer.dart';

import '../bloc/meals_bloc.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/meal_entity.dart';
import '../../../../core/utils/error_dialog.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/loading_indicator_util.dart';
import '../widgets/contents_widgets/contents_add_to_cart_but.dart';
import '../widgets/contents_widgets/contents_success_state_widget.dart';

class MealsContentsScreen extends StatefulWidget {
  const MealsContentsScreen({super.key, this.cartMeal});
  final MealEntity? cartMeal;

  @override
  State<MealsContentsScreen> createState() => _MealsContentsScreenState();
}

class _MealsContentsScreenState extends State<MealsContentsScreen> {
  late ScrollController _scrollController;
  late ValueNotifier<int> quantity;
  late ValueNotifier<double> price;
  final _formKey = GlobalKey<FormState>();
  bool isScrolledTo25Percent = false;
  MealEntity? theMeal;

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
              price.value = theMeal!.price;
              return ContentsSuccessCaseWidget(
                isScrolledTo25Percent: isScrolledTo25Percent,
                scrollController: _scrollController,
                quantity: quantity,
                price: price,
                formKey: _formKey,
                meal: meal,
              );
            }
            return Container();
          },
        ),
        floatingActionButton: ContentMealAddToCartBut(
          quantity: quantity,
          formKey: _formKey,
          theMeal: theMeal,
          price: price,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
    quantity = ValueNotifier<int>(theMeal?.quantity ?? IntManager.i_1);
    price = ValueNotifier<double>(theMeal?.price ?? DoubleManager.d_0);
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
    quantity.dispose();
    GlobalVariables().clearChosenList();
  }
}
