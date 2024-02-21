import 'package:flutter/material.dart';

import '../widgets/offers.dart';
import '../widgets/featured_meals.dart';
import '../widgets/meals_groups_section.dart';
import '../../../../core/utils/general_background.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/custom_scrolling_animated_template.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.menu(context)),
        titleTextStyle: Theme.of(context)
            .appBarTheme
            .titleTextStyle!
            .copyWith(fontSize: FontsSize.s25),
      ),
      body: const GeneralBackground(
        child: CustomScrollingAnimatedTemplate(
          children: [
            Offers(),
            SizedBox(height: DoubleManager.d_20),
            MealsGroups(),
            FeaturedMealsSection(),
          ],
        ),
      ),
    );
  }
}
