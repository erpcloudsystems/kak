import 'package:dio/dio.dart';

import '../models/meal.dart';
import '../models/meals_group.dart';
import '../models/meal_group_details.dart';
import '../../../../core/network/dio_helper.dart';
import '../../../../core/network/api_constance.dart';

abstract class MealsBaseRemoteDataSource {
  Future<List<MealGroupDetailsModel>> getMealsGroupsItems(String groupName);
  Future<MealModel> getMealDetails(String mealName);
  Future<List<MealsGroupModel>> getMealsGroups();
  Future<List<MealModel>> getFeatured();
  Future<List<MealModel>> getOffers();
}

class MealsRemoteDataSourceByDio implements MealsBaseRemoteDataSource {
  final BaseDioHelper dio;
  const MealsRemoteDataSourceByDio(this.dio);

  @override
  Future<List<MealModel>> getOffers() async {
    final response = await dio.get(
      useCookies: false,
      endPoint: ApiConstance.getOffersEndPoint,
    ) as Response;
    final List<MealModel> data = List.from(response.data['message'])
        .map((e) => MealModel.fromJson(e))
        .toList();
    return data;
  }

  @override
  Future<List<MealModel>> getFeatured() async {
    final response = await dio.get(
      useCookies: false,
      endPoint: ApiConstance.getFeaturedEndPoint,
    ) as Response;
    final List<MealModel> data = List.from(response.data['message'])
        .map((e) => MealModel.fromJson(e))
        .toList();
    return data;
  }

  @override
  Future<List<MealsGroupModel>> getMealsGroups() async {
    final response = await dio.get(
      useCookies: false,
      endPoint: ApiConstance.getMealsGroupsEndPoint,
    ) as Response;
    final List<MealsGroupModel> data = List.from(response.data['message'])
        .map((e) => MealsGroupModel.fromJson(e))
        .toList();
    return data;
  }

  @override
  Future<List<MealGroupDetailsModel>> getMealsGroupsItems(
      String groupName) async {
    final response = await dio.get(
        endPoint: ApiConstance.getMealsGroupsItemsEndPoint,
        useCookies: false,
        query: {'item_group': groupName}) as Response;

    final List<MealGroupDetailsModel> data = List.from(response.data['message'])
        .map((e) => MealGroupDetailsModel.fromJson(e))
        .toList();
    return data;
  }

  @override
  Future<MealModel> getMealDetails(String mealName) async {
    final response = await dio.get(
      endPoint: ApiConstance.getMealDetailsEndPoint,
      useCookies: false,
      query: {'name': mealName},
    ) as Response;

    final data = MealModel.fromJson(response.data['message'][0]);

    return data;
  }
}
