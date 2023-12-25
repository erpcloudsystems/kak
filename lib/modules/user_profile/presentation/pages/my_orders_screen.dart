import 'package:flutter/material.dart';

import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/custom_scrolling_animated_template.dart';
import '../../../meals/presentation/widgets/featured_meals_section.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringsManager.previousOrders),
      ),
      body: const CustomScrollingAnimatedTemplate(children: [
        Padding(
          padding: EdgeInsets.only(top: DoubleManager.d_10),
          child: Center(child: Card()),
        ),
      ]),
    );
  }
}
