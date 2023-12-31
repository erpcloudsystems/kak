import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../../core/resources/values_manager.dart';
import 'package:sizer/sizer.dart';

import '../../../bloc/social_sign/social_sign_bloc.dart';
import 'facebook_sign_widget.dart';
import 'google_sign_widget.dart';
import 'social_sign_components.dart';

class SocialSignWidget extends StatelessWidget {
  const SocialSignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: DoubleManager.d_10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FacebookSignWidget(
                facebookSignView: SocialSignComponent(
              authIcon: FontAwesomeIcons.facebook,
              signEvent: SignWithFacebookEvent(),
            )),
            GoogleSignWidget(
                googleSignView: SocialSignComponent(
              authIcon: FontAwesomeIcons.google,
              signEvent: SignWithGoogleEvent(),
            )),
            // SocialSignComponent(
            //   authIcon: FontAwesomeIcons.apple,
            //   signEvent: SignWithAppleEvent(),
            // )
            // const SignWithPhoneNumberWidget(
            //   phoneNumberSignView: PhoneSignComponentForSignUpScreen(),
            // ),
          ],
        ));
  }
}
