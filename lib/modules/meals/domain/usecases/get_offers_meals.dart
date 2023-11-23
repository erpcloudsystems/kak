import 'package:dartz/dartz.dart';

import '../entities/meal_entity.dart';
import '../repositories/meals_base_repo.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/global/base_use_case.dart';

class GetOffersMealsUseCase
    extends BaseUseCase<List<MealEntity>, NoParameters> {
  final MealsBaseRepo repo;
  GetOffersMealsUseCase(this.repo);

  @override
  Future<Either<Failure, List<MealEntity>>> call(
          NoParameters parameters) async =>
      await repo.getOffersMeals();
}
