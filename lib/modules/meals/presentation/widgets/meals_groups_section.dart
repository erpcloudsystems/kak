import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../bloc/meals_bloc.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/meal_group.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/custom_cached_image.dart';

class MealsGroups extends StatelessWidget {
  const MealsGroups({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 15.h,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: BlocBuilder<MealsBloc, MealsState>(
        buildWhen: (previous, current) =>
            previous.getMealsGroupsState != current.getMealsGroupsState,
        builder: (context, state) {
          if (state.getMealsGroupsState == RequestState.success) {
            final List<MealsGroupEntity> mealsGroups = state.getMealsGroupsData;
            return SuccessStateSection(mealsGroups: mealsGroups);
          }
          if (state.getMealsGroupsState == RequestState.error) {
            return Text(state.getMealsGroupsMessage);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class SuccessStateSection extends StatelessWidget {
  const SuccessStateSection({
    super.key,
    required this.mealsGroups,
  });

  final List<MealsGroupEntity> mealsGroups;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) =>
          const SizedBox(width: DoubleManager.d_15),
      scrollDirection: Axis.horizontal,
      itemCount: mealsGroups.length,
      itemBuilder: (BuildContext context, int index) {
        return MealsGroupElement(item: mealsGroups[index]);
      },
    );
  }
}

class MealsGroupElement extends StatelessWidget {
  const MealsGroupElement({
    required this.item,
    super.key,
  });

  final MealsGroupEntity item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // TODO: Navigate to Item Group.
      onTap: () {},
      child: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 3,
            child: CircleAvatar(
                radius: DoubleManager.d_40,
                backgroundColor: Colors.white,
                child: ClipOval(child: CustomCachedImage(url: item.imageUrl))),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: DoubleManager.d_4),
              child: Text(
                item.name,
                overflow: TextOverflow.clip,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: FontsSize.s10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
