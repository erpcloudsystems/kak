import 'package:dartz/dartz.dart';

import '../datasources/meals_remote.dart';
import '../../domain/entities/meal_group.dart';
import '../../../../core/network/failure.dart';
import '../../domain/entities/meal_entity.dart';
import '../../../../core/network/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/meals_base_repo.dart';

class MealsRepoImpl implements MealsBaseRepo {
  final MealsBaseRemoteDataSource dataSource;
  final BaseNetworkInfo networkInfo;

  const MealsRepoImpl(this.dataSource, this.networkInfo);

  @override
  Future<Either<Failure, List<MealEntity>>> getOffersMeals() async =>
      await _commonApiResponseMethod<List<MealEntity>>(
          () => dataSource.getOffers());

  @override
  Future<Either<Failure, List<MealEntity>>> getFeaturedMeals() async =>
      await _commonApiResponseMethod<List<MealEntity>>(
          () => dataSource.getFeatured());

  @override
  Future<Either<Failure, List<MealsGroupEntity>>> getMealsGroups() async =>
      await _commonApiResponseMethod<List<MealsGroupEntity>>(
          () => dataSource.getMealsGroups());

  @override
  Future<Either<Failure, List<MealEntity>>> getMealGroupItems(
          String groupName) async =>
      await _commonApiResponseMethod<List<MealEntity>>(
          () => dataSource.getMealsGroupsItems(groupName));

  @override
  Future<Either<Failure, MealEntity>> getMealDetails(String mealName) async =>
      await _commonApiResponseMethod<MealEntity>(
          () => dataSource.getMealDetails(mealName));

//_________________________common method_____________________________
  Future<Either<Failure, T>> _commonApiResponseMethod<T>(
      Future<T> Function() wantedMethod) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await wantedMethod();
        return Right(data);
      } on PrimaryServerException catch (error) {
        return Left(
          ServerFailure(errorMessage: error.message),
        );
      }
    } else {
      return const Left(OfflineFailure());
    }
  }
}
