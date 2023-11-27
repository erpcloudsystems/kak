import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../bloc/meals_bloc.dart';
import 'featured_meals_section.dart';
import '../../../../core/utils/enums.dart';

class FeaturedMealsSection extends StatelessWidget {
  const FeaturedMealsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsBloc, MealsState>(
      buildWhen: (previous, current) =>
          previous.getFeaturedState != current.getFeaturedState ||
          previous.getFeaturedData != current.getFeaturedData,
      builder: (context, state) {
        if (state.getFeaturedState == RequestState.success) {
          return FeaturedMeals(featuredMeals: state.getFeaturedData);
        }
        if (state.getFeaturedState == RequestState.error) {
          return SizedBox(child: Text(state.getFeaturedMessage));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
