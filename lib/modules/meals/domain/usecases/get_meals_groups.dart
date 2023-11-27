import 'package:dartz/dartz.dart';

import '../entities/meal_group.dart';
import '../repositories/meals_base_repo.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/global/base_use_case.dart';

class GetMealsGroupsUseCase
    extends BaseUseCase<List<MealsGroupEntity>, NoParameters> {
  final MealsBaseRepo repo;

  GetMealsGroupsUseCase(this.repo);

  @override
  Future<Either<Failure, List<MealsGroupEntity>>> call(
          NoParameters parameters) async =>
      await repo.getMealsGroups();
}
