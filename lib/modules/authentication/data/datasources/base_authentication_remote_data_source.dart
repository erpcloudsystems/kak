import 'dart:async';

import 'package:dartz/dartz.dart';

import '../models/user_model.dart';
import 'social_sign_data_source.dart';
import 'regular_sign_data_source.dart';
import '../models/logged_user_entity.dart';

abstract class BaseAuthenticationRemoteDataSource {
  Future<LoggedInUserModel> signIn(UserModel user);
  Future<Unit> signUp(UserModel user);
  Future<UserModel> signWithGoogle();

  // Future<PhoneAuthState> signWithPhoneNumber(String phoneNumber);
  // Future<Unit> resetPassword(String email);
  // Future<Unit> otpVerify(String code);
  // Future<UserModel> signWithFacebook();
  // Future<bool> verifyUser();
  // Future<Unit> signOut();
}

class AuthenticationRemoteDataSource extends RegularSignDataSource
    with SocialSignDataSource
    implements BaseAuthenticationRemoteDataSource {
  AuthenticationRemoteDataSource(super.dio);

  @override
  Future<LoggedInUserModel> signIn(UserModel user) async => await regularSignIn(user);

  @override
  Future<Unit> signUp(UserModel user) async => await regularSignUp(user);

  @override
  Future<UserModel> signWithGoogle() => socialSignWithGoogle();

  // @override
  // Future<UserModel> signWithFacebook() => socialSignWithFacebook();

  // @override
  // Future<Unit> signOut() => firebaseSignOut();

  // @override
  // Future<bool> verifyUser() => firebaseVerifyUser();

  // @override
  // Future<PhoneAuthState> signWithPhoneNumber(String phoneNumber) =>
  //     socialSignWithPhoneNumber(phoneNumber);

  // @override
  // Future<Unit> otpVerify(String code) => socialOtpVerification(code);

  // @override
  // Future<Unit> resetPassword(String email) => firebaseResetPassword(email);
}
