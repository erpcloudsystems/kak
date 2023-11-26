import 'package:dartz/dartz.dart';

import '../datasources/meals_remote.dart';
import '../../../../core/global/type_def.dart';
import '../../../../core/network/failure.dart';
import '../../domain/entities/meal_entity.dart';
import '../../../../core/network/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/meals_base_repo.dart';
import '../../../../core/resources/strings_manager.dart';

class MealsRepoImpl implements MealsBaseRepo {
  final MealsBaseRemoteDataSource dataSource;
  final BaseNetworkInfo networkInfo;

  const MealsRepoImpl(this.dataSource, this.networkInfo);

  @override
  Future<Either<Failure, List<MealEntity>>> getOffersMeals() async =>
      _commonMethod(() => dataSource.getOffers());

  @override
  Future<Either<Failure, List<MealEntity>>> getFeaturedMeals() async =>
      _commonMethod(() => dataSource.getFeatured());

  //_________________common sign with email and password method____________________
  Future<Either<Failure, List<MealEntity>>> _commonMethod(
      FutureMealsListFunction wantedMethod) async {
    if (await networkInfo.isConnected) {
      try {
        final List<MealEntity> meals = await wantedMethod();
        return Right(meals);
      } on PrimaryServerException catch (error) {
        return Left(
          ServerFailure(errorMessage: error.message),
        );
      }
    } else {
      return const Left(
          OfflineFailure(errorMessage: StringsManager.offlineFailureMessage));
    }
  }
}