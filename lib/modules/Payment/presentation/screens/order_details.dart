import 'package:flutter/material.dart';


import '../../../../core/resources/values_manager.dart';
import '../../../meals/domain/entities/meal_entity.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/custom_floating_button.dart';
import '../widgets/order_details/customer_details_section.dart';
import '../widgets/order_details/order_details_items_section.dart';
import '../widgets/order_details/order_details_payment_summary.dart';
import '../../../../core/utils/custom_scrolling_animated_template.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(StringsManager.orderDetails)),
      body: Padding(
        padding: const EdgeInsets.all(DoubleManager.d_8),
        child: CustomScrollingAnimatedTemplate(children: [
          // Customer details:
          const CustomerDetailsSection(),

          // Items:
          OrderDetailsItemsSection(meals: meals),

          // Payment summary:
          const OrderDetailsPaymentSummary(),

          const SizedBox(height: DoubleManager.d_50)
        ]),
      ),
      floatingActionButton: CustomFloatingButton(
        title: StringsManager.reorder,
        onPressed: () {},
      ),
    );
  }
}

List<MealEntity> meals = [
  const MealEntity(
      description: '',
      imageUrl: '',
      price: 20,
      name: 'Test',
      id: '0',
      quantity: 1),
  const MealEntity(
      description: '',
      imageUrl: '',
      price: 30,
      name: 'Test2',
      id: '0',
      quantity: 2),
  const MealEntity(
      description: '',
      imageUrl: '',
      price: 22,
      name: 'Test3',
      id: '0',
      quantity: 12),
];
