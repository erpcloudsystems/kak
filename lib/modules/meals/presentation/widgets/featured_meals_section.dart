import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../bloc/meals_bloc.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/resources/routes.dart';
import '../../domain/entities/meal_entity.dart';
import '../../../../core/utils/snack_bar_util.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../Cart/presentation/bloc/cart_bloc.dart';
import '../../../../core/utils/custom_cached_image.dart';
import '../../../../core/resources/strings_manager.dart';

class FeaturedMeals extends StatelessWidget {
  const FeaturedMeals({
    super.key,
    this.isHome = true,
    required this.featuredMeals,
  });

  final List<MealEntity> featuredMeals;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.addCartItemState != current.addCartItemState,
      listener: (context, state) {
        if (state.addCartItemState == RequestState.success) {
          // Navigator.of(context).pushNamedAndRemoveUntil(
          //   Routes.cartScreenKey,
          //   (route) => route.settings.name == Routes.navigationBarScreenKey,
          // );
          SnackBarUtil().getSnackBar(
            context: context,
            message: state.addCartItemMessage,
            color: ColorsManager.gGreen,
          );
        }

        if (state.addCartItemState == RequestState.error) {
          SnackBarUtil().getSnackBar(
            context: context,
            message: state.addCartItemMessage,
            color: ColorsManager.gRed,
          );
        }
      },
      child: ListView.separated(
        shrinkWrap: true,
        physics: isHome
            ? const NeverScrollableScrollPhysics()
            : const BouncingScrollPhysics(),
        itemCount: featuredMeals.length,
        separatorBuilder: (context, index) =>
            const SizedBox(height: DoubleManager.d_20),
        itemBuilder: (context, index) =>
            FeaturedMealsElement(meal: featuredMeals[index], isHome: isHome),
      ),
    );
  }
}

class FeaturedMealsElement extends StatelessWidget {
  const FeaturedMealsElement({
    super.key,
    required this.meal,
    required this.isHome,
  });

  final MealEntity meal;
  final bool isHome;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<MealsBloc>(context)
            .add(GetMealDetailsEvent(mealName: meal.id));
        Navigator.of(context).pushNamed(Routes.mealContentsScreenKey);
      },
      child: Card(
          elevation: DoubleManager.d_8,
          margin: const EdgeInsets.symmetric(horizontal: DoubleManager.d_10),
          child: Container(
            height: DoubleManager.d_15.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(DoubleManager.d_20),
            ),
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: DoubleManager.d_8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Name
                      SizedBox(
                          width: DoubleManager.d_50.w,
                          child: FittedBox(
                            alignment: AlignmentDirectional.centerEnd,
                            fit: BoxFit.scaleDown,
                            child: Text(meal.name),
                          )),

                      // Description
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          width: DoubleManager.d_200,
                          child: Text(
                            overflow: TextOverflow.visible,
                            softWrap: true,
                            maxLines: 2,
                            textAlign: TextAlign.right,
                            meal.description,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: FontsSize.s10),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Add button
                            Container(
                              margin: const EdgeInsets.only(bottom: 2),
                              height: DoubleManager.d_30,
                              width: DoubleManager.d_130,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorsManager.mainColor,
                                    shape: const ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                DoubleManager.d_20)))),
                                onPressed: () =>
                                    BlocProvider.of<CartBloc>(context)
                                        .add(AddCartItemEvent(meal: meal)),
                                child: Text(
                                    isHome
                                        ? StringsManager.addToCart
                                        : StringsManager.reorder,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          fontSize: FontsSize.s12,
                                          color: Colors.white,
                                        )),
                              ),
                            ),
                            const SizedBox(width: DoubleManager.d_15),
                            // Price
                            Text('${UnTranslatedStrings.egp} ${meal.price}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      fontSize: FontsSize.s14,
                                      color: ColorsManager.mainColor,
                                    ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Image
                Expanded(
                  child: CustomCachedImage(
                    url: meal.imageUrl,
                    height: DoubleManager.d_120,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
