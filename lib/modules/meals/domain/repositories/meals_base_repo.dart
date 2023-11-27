import 'package:dartz/dartz.dart';

import '../entities/meal_group.dart';
import '../entities/meal_entity.dart';
import '../entities/meal_group_details.dart';
import '../../../../core/network/failure.dart';

abstract class MealsBaseRepo {
  Future<Either<Failure, List<MealGroupDetailsEntity>>> getMealGroupItems(
      String groupName);
  Future<Either<Failure, List<MealsGroupEntity>>> getMealsGroups();
  Future<Either<Failure, List<MealEntity>>> getFeaturedMeals();
  Future<Either<Failure, List<MealEntity>>> getOffersMeals();
}
