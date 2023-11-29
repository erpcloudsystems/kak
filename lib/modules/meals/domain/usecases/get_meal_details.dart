import 'package:dartz/dartz.dart';

import '../entities/meal_entity.dart';
import '../repositories/meals_base_repo.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/global/base_use_case.dart';

class GetMealDetailsUseCase extends BaseUseCase<MealEntity, String> {
  final MealsBaseRepo repo;
  GetMealDetailsUseCase(this.repo);

  @override
  Future<Either<Failure, MealEntity>> call(String parameters) async => 
  await repo.getMealDetails(parameters);
}
