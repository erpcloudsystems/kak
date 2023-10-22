import 'package:flutter/material.dart';
import 'package:kak/core/resources/strings_manager.dart';
import 'package:kak/core/utils/enums.dart';
import 'package:kak/modules/meals/domain/entities/meal_entity.dart';
import 'package:kak/modules/meals/presentation/widgets/offers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(StringsManager.menu)),
      body: ListView(
        shrinkWrap: true,
        children: const [Offers(itemList: dummyMealsData)],
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
