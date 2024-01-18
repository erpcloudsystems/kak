import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'google_sign_widget.dart';
import 'facebook_sign_widget.dart';
import 'social_sign_components.dart';
import '../../../pages/sign_in_screen.dart';
import '../../../bloc/social_sign/social_sign_bloc.dart';
import '../../../bloc/regular_sign/authentication_bloc.dart';
import '../../../../../../core/resources/values_manager.dart';

class SocialSignWidget extends StatelessWidget {
  const SocialSignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    /* We listen to the sign in state changes here because we can't listen to the changes
    in the sign up screen as it gets error, and we need to listen to the changes because
    of the social sign, as we change the same state that changes with the regular sign in */
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, current) =>
          previous.signInState != current.signInState,
      listener: SignInScreen.loginHandlerMethod,
      child: Padding(
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
          )),
    );
  }
}
