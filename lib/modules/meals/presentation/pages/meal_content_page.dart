import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/entities/meal_entity.dart';
import '../widgets/custom_meals/choices_section.dart';
import '../../../../core/resources/values_manager.dart';
import '../widgets/custom_meals/custom_bottom_button.dart';
import '../widgets/custom_meals/meal_custom_app_bar.dart';
import '../widgets/custom_meals/description_section.dart';

const List<String> additionalList = ['Coleslaw', 'Rizo', 'Bread'];
const List<String> drinksList = ['Pepsi', 'Cokacola', '7 UP'];
List<String> mealTypeList = [MealType.regular.name, MealType.spicy.name];
const MealEntity mealTest = MealEntity(
    priceAfterDiscount: 20,
    additionalItems: [],
    description:
        '1 single beef or chicken sandwich + 1 single beef + burger or 1 single chicken burger + 1 Drink + medium fries',
    mealType: MealType.regular,
    quantity: 1,
    imageUrl:
        'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fried-chicken-promo-design-template-77d37eb3a58ba753f502774abd21dbae_screen.jpg?ts=1655303745',
    price: 175,
    name: 'Family Meal');

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
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            MealsCustomSliverAppBar(
                isScrolledTo25Percent: isScrolledTo25Percent, meal: mealTest),
            const DescriptionSection(meal: mealTest),
            ChoicesSection(choicesList: mealTypeList),
            const ChoicesSection(choicesList: additionalList),
            const ChoicesSection(choicesList: drinksList),
            SliverToBoxAdapter(
              child: SizedBox.fromSize(
                  size: Size.fromHeight(
                      kBottomNavigationBarHeight + DoubleManager.d_5.h)),
            )
          ],
        ),
        floatingActionButton: const MealCustomBottomButton(total: '175'),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
}
