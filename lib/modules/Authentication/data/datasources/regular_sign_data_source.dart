import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/logged_user.dart';
import '../../../../core/network/dio_helper.dart';
import '../../../../core/network/api_constance.dart';
import '../../../authentication/data/models/user_model.dart';

class RegularSignDataSource {
  final BaseDioHelper _dio;
  const RegularSignDataSource(this._dio);

//_________________ Sign in_________________________________________
  Future<LoggedInUserModel> signIn(UserModel user) async {
    final response = await _dio.post(
      endPoint: ApiConstance.loginEndPoint,
      data: user.toJsonSignIn(),
      useCookies: false,
    ) as Response;

    final returnedUser = LoggedInUserModel.fromJson(response.data['message']);

    return returnedUser;
  }

//_________________ Sign up__________________________________________
  Future<Unit> signUp(UserModel user) async {
    await _dio.post(
      endPoint: ApiConstance.signUpEndPoint,
      query: user.toJsonSignUp(),
      useCookies: false,
    );

    return Future.value(unit);
  }

//_________________ Reset password ___________________________________
  Future<Unit> resetPassword(String email) async {
    await _dio.get(
      endPoint: ApiConstance.resetPasswordEndPoint,
      query: {'email': email},
    );

    return Future.value(unit);
  }

//______________________ Logout _____________________________________
  Future<Unit> logout(String email) async {
    await _dio.get(
      endPoint: ApiConstance.logoutEndPoint,
      query: {'user': email},
    );

    return Future.value(unit);
  }

//____________________ delete user___________________________________
  Future<Unit> deleteUserAccount(String email) async {
    await _dio.get(
      endPoint: ApiConstance.deleteUserEndPoint,
      query: {'user': email},
    );

    return Future.value(unit);
  }
}
