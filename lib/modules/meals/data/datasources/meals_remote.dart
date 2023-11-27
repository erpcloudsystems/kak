import 'package:dio/dio.dart';

import '../models/meal.dart';
import '../models/meals_group.dart';
import '../../../../core/network/dio_helper.dart';
import '../../../../core/network/api_constance.dart';

abstract class MealsBaseRemoteDataSource {
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
}