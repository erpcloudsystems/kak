import 'package:dartz/dartz.dart';

import '../entities/meal_entity.dart';
import '../../../../core/network/failure.dart';

abstract class MealsBaseRepo {
Future<Either<Failure, List<MealEntity>>> getOffersMeals();
}