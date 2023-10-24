import 'package:flutter/material.dart';

import '../widgets/offers.dart';
import '../../../../core/utils/enums.dart';
import '../widgets/appetizers_section.dart';
import '../../domain/entities/meal_entity.dart';
import '../widgets/featured_meals_section.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(StringsManager.menu)),
      body: const Column(
        children: [
          Offers(itemList: dummyMealsData),
          SizedBox(height: DoubleManager.d_60),
          Appetizers(),
          SizedBox(height: DoubleManager.d_20),
          FeaturedMeals(featuredMeals: dummyMealsData),
        ],
      ),
    );
  }
}

const String testImage =
    'https://images.summitmedia-digital.com/sap/images/2020/11/11/spot-mcdo-clientimage-mainimage-1-1605081243.jpg';
const List<MealEntity> dummyMealsData = [
  MealEntity(
      priceAfterDiscount: 20,
      additionalItems: [],
      description: '',
      mealType: MealType.regular,
      quantity: 1,
      imageUrl: testImage,
      price: 175,
      name: 'Family Meal'),
  MealEntity(
      priceAfterDiscount: 20,
      additionalItems: [],
      description: '',
      mealType: MealType.regular,
      quantity: 1,
      imageUrl: testImage,
      price: 10,
      name: 'test'),
  MealEntity(
      priceAfterDiscount: 20,
      additionalItems: [],
      description: '',
      mealType: MealType.regular,
      quantity: 1,
      imageUrl: testImage,
      price: 10,
      name: 'test'),
  MealEntity(
      priceAfterDiscount: 20,
      additionalItems: [],
      description: '',
      mealType: MealType.regular,
      quantity: 1,
      imageUrl: testImage,
      price: 10,
      name: 'test'),
  MealEntity(
      priceAfterDiscount: 20,
      additionalItems: [],
      description: '',
      mealType: MealType.regular,
      quantity: 1,
      imageUrl: testImage,
      price: 10,
      name: 'test'),
];
