import 'package:flutter/material.dart';
import 'package:kak/modules/meals/presentation/pages/home_page.dart';
import 'package:kak/modules/meals/presentation/widgets/featured_meals_section.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previous orders'),
      ),
      body: const FeaturedMeals(featuredMeals: dummyMealsData),
    );
  }
}
