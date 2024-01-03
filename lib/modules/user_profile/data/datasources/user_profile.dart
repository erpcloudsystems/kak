import 'package:dio/dio.dart';

import '../models/user_profile.dart';
import '../../../../core/network/dio_helper.dart';
import '../../../../core/network/api_constance.dart';

abstract class UserProfileBaseDataSource {
  Future<UserProfileModel> getUserProfile();
}

class UserProfileDataSourceByDio implements UserProfileBaseDataSource {
  final BaseDioHelper dio;
  UserProfileDataSourceByDio(this.dio);

  @override
  Future<UserProfileModel> getUserProfile() async {
    final response =
        await dio.get(endPoint: ApiConstance.getUserProfileEndPoint) as Response;

    final data = UserProfileModel.fromJson(response.data['message']);

    return data;    
  }
}
