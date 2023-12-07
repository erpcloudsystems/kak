import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'custom_cached_image.dart';
import '../resources/fonts_manager.dart';
import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';
import '../resources/strings_manager.dart';
import '../../modules/Cart/presentation/bloc/cart_bloc.dart';
import '../../modules/meals/domain/entities/meal_entity.dart';

class CustomAnimatedGridChild extends StatelessWidget {
  const CustomAnimatedGridChild({super.key, required this.meal});

  final MealEntity meal;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          fit: FlexFit.tight,
          flex: IntManager.i_4,
          child: Container(
            margin: const EdgeInsets.only(bottom: DoubleManager.d_5),
            decoration: BoxDecoration(
              color: Colors.white70,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(DoubleManager.d_15),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Image
                CustomCachedImage(url: meal.imageUrl),

                // Add icon
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () => context
                          .read<CartBloc>()
                          .add(AddCartItemEvent(meal: meal)),
                      icon: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.circular(DoubleManager.d_8),
                            color: ColorsManager.mainColor.withOpacity(.8),
                          ),
                          child: const Icon(
                            Icons.add,
                            size: DoubleManager.d_25,
                            color: ColorsManager.gWhite,
                          ))),
                ),
              ],
            ),
          ),
        ),

        // Name
        Flexible(
          fit: FlexFit.loose,
          flex: IntManager.i_1,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              meal.name,
              overflow: TextOverflow.clip,
              softWrap: true,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: FontsSize.s14),
            ),
          ),
        ),

        // Price
        Flexible(
            flex: IntManager.i_1,
            fit: FlexFit.loose,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${UnTranslatedStrings.egp} ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: FontsSize.s12),
                ),
                Text(
                  meal.price.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: FontsSize.s12),
                ),
              ],
            )),
      ],
    );
  }
}
