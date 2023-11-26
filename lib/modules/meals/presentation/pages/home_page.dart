import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kak/core/utils/enums.dart';
import 'package:kak/modules/meals/presentation/bloc/meals_bloc.dart';

import '../widgets/offers.dart';
import '../widgets/appetizers_section.dart';
import '../../domain/entities/meal_entity.dart';
import '../widgets/featured_meals_section.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/custom_scrolling_animated_template.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(StringsManager.menu)),
      body: CustomScrollingAnimatedTemplate(
        children: [
          const Offers(),
          const SizedBox(height: DoubleManager.d_60),
          const Appetizers(),
          const SizedBox(height: DoubleManager.d_20),
          BlocBuilder<MealsBloc, MealsState>(
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
          ),
        ],
      ),
    );
  }
}

const String testImage =
    'https://images.summitmedia-digital.com/sap/images/2020/11/11/spot-mcdo-clientimage-mainimage-1-1605081243.jpg';
const List<MealEntity> dummyMealsData = [
  MealEntity(
      id: 'test',
      description:
          '1 chicken sandwich + 1 single beef + burger or 1 single chicken burger + 1 Drink + medium fries',
      imageUrl:
          'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fried-chicken-promo-design-template-77d37eb3a58ba753f502774abd21dbae_screen.jpg?ts=1655303745',
      price: 175,
      name: 'Family Meal'),
  MealEntity(
      description:
          '1 chicken sandwich + 1 single beef + 1 single chicken burger + 1 Drink + medium fries',
      id: 'test',
      imageUrl:
          'https://img.pikbest.com/origin/05/92/09/85zpIkbEsTZKx.jpg!w700wp',
      price: 10,
      name: 'test'),
  MealEntity(
      description:
          '1 chicken sandwich + 1 single beef + 1 single chicken burger + 1 Drink + medium fries',
      id: 'test',
      imageUrl: testImage,
      price: 10,
      name: 'test'),
  MealEntity(
      description:
          '1 chicken sandwich + 1 single beef + 1 single chicken burger + 1 Drink + medium fries',
      id: 'test',
      imageUrl: testImage,
      price: 10,
      name: 'test'),
  MealEntity(
      description:
          '1 chicken sandwich + 1 single beef + 1 single chicken burger + 1 Drink + medium fries',
      id: 'test',
      imageUrl: testImage,
      price: 10,
      name: 'test'),
  MealEntity(
      description:
          '1 chicken sandwich + 1 single beef + 1 single chicken burger + 1 Drink + medium fries',
      id: 'test',
      imageUrl: testImage,
      price: 10,
      name: 'test'),
  MealEntity(
      description:
          '1 chicken sandwich + 1 single beef + 1 single chicken burger + 1 Drink + medium fries',
      id: 'test',
      imageUrl: testImage,
      price: 10,
      name: 'test'),
];
