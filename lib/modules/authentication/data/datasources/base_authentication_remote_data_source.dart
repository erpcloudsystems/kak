import 'dart:async';

import 'package:dartz/dartz.dart';

import '../models/user_model.dart';
import 'social_sign_data_source.dart';
import 'regular_sign_data_source.dart';
import '../models/logged_user_entity.dart';

abstract class BaseAuthenticationRemoteDataSource {
  Future<LoggedInUserModel> signIn(UserModel user);
  Future<Unit> deleteUserAccount(String email);
  Future<Unit> resetPassword(String email);
  Future<Unit> signUp(UserModel user);
  Future<Unit> logout(String email);

  Future<UserModel> signWithGoogle();

  // Future<UserModel> signWithFacebook();
}

class AuthenticationRemoteDataSource extends RegularSignDataSource
    with SocialSignDataSource
    implements BaseAuthenticationRemoteDataSource {
  AuthenticationRemoteDataSource(super.dio);
}
