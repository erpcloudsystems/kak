import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'choices_section.dart';
import 'meal_custom_app_bar.dart';
import 'description_section.dart';
import '../../../domain/entities/meal_entity.dart';
import '../../../../../core/resources/values_manager.dart';

class ContentsSuccessCaseWidget extends StatelessWidget {
  const ContentsSuccessCaseWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required ScrollController scrollController,
    required this.isScrolledTo25Percent,
    required this.meal,
    required this.quantity,
  })  : _formKey = formKey,
        _scrollController = scrollController;

  final GlobalKey<FormState> _formKey;
  final ScrollController _scrollController;
  final bool isScrolledTo25Percent;
  final MealEntity meal;
  final ValueNotifier<int> quantity;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          MealsCustomSliverAppBar(
              isScrolledTo25Percent: isScrolledTo25Percent, meal: meal),
          DescriptionSection(meal: meal, quantity: quantity),
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
}