import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/user_model.dart';
import '../models/logged_user_entity.dart';
import '../../../../core/network/dio_helper.dart';
import '../../../../core/network/api_constance.dart';

class RegularSignDataSource {
  final BaseDioHelper _dio;
  const RegularSignDataSource(this._dio);

//_________________ Sign in_____________________________________
  Future<LoggedInUserModel> regularSignIn(UserModel user) async {
    final response = await _dio.post(
      endPoint: ApiConstance.loginEndPoint,
      query: user.toJsonSignIn(),
    ) as Response;

    final returnedUser = LoggedInUserModel.fromJson(response.data);

    return returnedUser;
  }

//_________________ Sign up_____________________________________
  Future<Unit> regularSignUp(UserModel user) async {
    await _dio.post(
      endPoint: ApiConstance.loginEndPoint,
      query: user.toJsonSignUp(),
    );

    return Future.value(unit);
  }

// //_________________ Sign out_____________________________________
//   Future<Unit> firebaseSignOut() async {
//     await _fireAuth.signOut();
//     return Future.value(unit);
//   }

// //_________________ verify user___________________________________
//   Future<bool> firebaseVerifyUser() async {
//     final user = _fireAuth.currentUser!;
//     await user.reload();
//     if (user.emailVerified) {
//       return Future.value(true);
//     }
//     return Future.value(false);
//   }

// //_________________ Reset password ___________________________________
//   Future<Unit> firebaseResetPassword(String email) async {
//     await _fireAuth.sendPasswordResetEmail(email: email);
//     return Future.value(unit);
}
