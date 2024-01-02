import 'package:dartz/dartz.dart';

import '../datasources/meals_remote.dart';
import '../../domain/entities/meal_group.dart';
import '../../../../core/network/failure.dart';
import '../../domain/entities/meal_entity.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/meals_base_repo.dart';
import '../../../../core/network/helper_network_methods.dart';

class MealsRepoImpl implements MealsBaseRepo {
  final MealsBaseRemoteDataSource dataSource;
  final BaseNetworkInfo networkInfo;

  const MealsRepoImpl(this.dataSource, this.networkInfo);

  @override
  Future<Either<Failure, List<MealEntity>>> getOffersMeals() async =>
      await HelperNetworkMethods.commonApiResponseMethod<List<MealEntity>>(
          () => dataSource.getOffers(), networkInfo);

  @override
  Future<Either<Failure, List<MealEntity>>> getFeaturedMeals() async =>
      await HelperNetworkMethods.commonApiResponseMethod<List<MealEntity>>(
          () => dataSource.getFeatured(), networkInfo);

  @override
  Future<Either<Failure, List<MealsGroupEntity>>> getMealsGroups() async =>
      await HelperNetworkMethods.commonApiResponseMethod<
              List<MealsGroupEntity>>(
          () => dataSource.getMealsGroups(), networkInfo);

  @override
  Future<Either<Failure, List<MealEntity>>> getMealGroupItems(
          String groupName) async =>
      await HelperNetworkMethods.commonApiResponseMethod<List<MealEntity>>(
          () => dataSource.getMealsGroupsItems(groupName), networkInfo);

  @override
  Future<Either<Failure, MealEntity>> getMealDetails(String mealName) async =>
      await HelperNetworkMethods.commonApiResponseMethod<MealEntity>(
          () => dataSource.getMealDetails(mealName), networkInfo);
}
