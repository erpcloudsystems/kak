import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
    try {
      final GoogleSignIn googleSignIn =
          GoogleSignIn(scopes: ['email', 'profile']);
      final account = await googleSignIn.signIn();
      if (account != null) {
        final nameParts = account.displayName!.split(' ');
        final user = UserModel(
          email: account.email,
          password: account.id,
          firstName: nameParts.isNotEmpty ? nameParts.first : null,
          lastName: nameParts.length > 1 ? nameParts.last : null,
          image: account.photoUrl,
          phoneNumber: '',
        );
        return Future.value(user);
      } else {
        throw PrimaryServerException(
          error: 'Google sign error',
          code: 100,
          message: 'Google Sign-In canceled by user',
        );
      }
    } catch (error) {
      throw PrimaryServerException(
        error: 'Google sign error',
        code: 100,
        message: error.toString(),
      );
    }
  }
}
