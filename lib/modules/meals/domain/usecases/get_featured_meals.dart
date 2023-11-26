import 'package:dartz/dartz.dart';

import '../entities/meal_entity.dart';
import '../../../../core/network/failure.dart';
import '../repositories/meals_base_repo.dart';
import '../../../../core/global/base_use_case.dart';

class GetFeaturedMealsUseCase extends BaseUseCase<List<MealEntity>, NoParameters>{
  final MealsBaseRepo repo;
  GetFeaturedMealsUseCase(this.repo);
  
  @override
  Future<Either<Failure, List<MealEntity>>> call(NoParameters parameters) async =>
  await repo.getFeaturedMeals(); 
}