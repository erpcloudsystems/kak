import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/user_profile.dart';
import '../../../../core/network/dio_helper.dart';
import '../../../../core/network/api_constance.dart';

abstract class UserProfileBaseDataSource {
  Future<UserProfileModel> getUserProfile();
  Future<Unit> editUserProfile(UserProfileModel user);
}

class UserProfileDataSourceByDio implements UserProfileBaseDataSource {
  final BaseDioHelper dio;
  UserProfileDataSourceByDio(this.dio);

  // Get user profile ___________________________________________________
  @override
  Future<UserProfileModel> getUserProfile() async {
    final response = await dio.get(
        endPoint: ApiConstance.getUserProfileEndPoint) as Response;

    final data = UserProfileModel.fromJson(response.data['message'][0]);

    return data;
  }

  // Edit user profile ___________________________________________________
  @override
  Future<Unit> editUserProfile(UserProfileModel user) async {
    await dio.patch(
      endPoint: ApiConstance.editUserProfileEndPoint,
      data: user.toJson(),
    );

    return Future.value(unit);
  }
}
