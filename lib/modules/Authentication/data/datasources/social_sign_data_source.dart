import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/utils/extensions.dart';
import '../../../../core/network/exceptions.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../authentication/data/models/user_model.dart';

mixin SocialSignDataSource {
  //_______________________________Sign with facebook__________________________
  Future<UserModel> signWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    switch (result.status) {
      case LoginStatus.success:
        final Map<String, dynamic> userData = await FacebookAuth.instance
            .getUserData(
                fields: 'first_name, last_name, email,picture.width(200)');
        final userModel = UserModel.fromFacebookMap(userData);
        return Future.value(userModel);
      case LoginStatus.cancelled:
        throw FacebookException(
            message: StringsWithNoCtx.cancelledLoginWithFace.tr());
      default:
        throw FacebookException(
            message: StringsWithNoCtx.cancelledLoginWithFace.tr());
    }
  }

  //_______________________________Sign with Google______________________________
  Future<UserModel> signWithGoogle() async {
    final fireAuth = FirebaseAuth.instance;
    // String? userVerificationId;
    // int? userForceResendingToken;
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    final googleSignInAccount = await googleSignIn.signIn();
    final googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);
    await fireAuth.signInWithCredential(credential);
    final UserModel user = UserModel(
      email: googleSignInAccount.email,
      password: googleSignInAccount.id,
      firstName: '',
      lastName: '',
      phoneNumber: '',
    );
    return Future.value(user);
  }
}
