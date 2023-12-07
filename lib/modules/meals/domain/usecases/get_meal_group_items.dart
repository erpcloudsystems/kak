import 'package:dartz/dartz.dart';

import '../entities/meal_entity.dart';
import '../repositories/meals_base_repo.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/global/base_use_case.dart';

class GetMealGroupItemsUseCase extends BaseUseCase<List<MealEntity>, String> {
  final MealsBaseRepo repo;

  GetMealGroupItemsUseCase(this.repo);

  @override
  Future<Either<Failure, List<MealEntity>>> call(String parameters) async =>
      await repo.getMealGroupItems(parameters);
}
