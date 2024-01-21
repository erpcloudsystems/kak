import 'dart:async';

import 'package:dartz/dartz.dart';

import '../models/logged_user.dart';
import 'social_sign_data_source.dart';
import 'regular_sign_data_source.dart';
import '../../../authentication/data/models/user_model.dart';

abstract class BaseAuthenticationRemoteDataSource {
  Future<LoggedInUserModel> socialSign(UserModel user);
  Future<LoggedInUserModel> signIn(UserModel user);
  Future<Unit> deleteUserAccount(String email);
  Future<Unit> resetPassword(String email);
  Future<Unit> signUp(UserModel user);
  Future<Unit> logout(String email);

  Future<UserModel> signWithGoogle();
  Future<UserModel> signWithFacebook();
}

class AuthenticationRemoteDataSource extends RegularSignDataSource
    with SocialSignDataSource
    implements BaseAuthenticationRemoteDataSource {
  AuthenticationRemoteDataSource(super.dio);
  
}
