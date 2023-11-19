import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';
import '../../../../core/resources/routes.dart';
import '../bloc/regular_sign/authentication_bloc.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../widgets/sign_screen_components/form_components/sign_form.dart';
import '../widgets/sign_screen_components/sign_screens_shared_components/main_logo.dart';
import '../widgets/sign_screen_components/social_sign_components/social_sign_widget.dart';
import '../widgets/sign_screen_components/sign_screens_shared_components/sign_type_text.dart';
import '../widgets/sign_screen_components/sign_screens_shared_components/have_account_widget.dart';
import '../widgets/sign_screen_components/sign_in_screen_widgets.dart/forgot_password_button.dart';
import '../widgets/sign_screen_components/sign_screens_shared_components/authentication_divider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final globalVariables = GlobalVariables();
    return const SafeArea(
      child: Scaffold(
        body:
            //  BlocListener<AuthenticationBloc, AuthenticationState>(
            //   listenWhen: (previous, current) =>
            //       previous.signInState != current.signInState,
            //   listener: (context, state) {
            //     if (state.signInState == RequestState.success) {
            //       if (globalVariables.getUserDecision == true) {
            //         BlocProvider.of<CachingUserDataBloc>(context).add(
            //             CacheUserDataEvent(
            //                 userEmail: globalVariables.getGlobalUserEmail));
            //       }
            //       Navigator.of(context).pushNamed(Routes.onBoardingScreenKey);
            //     }

            //     if (state.signInState == RequestState.error) {
            //       SnackBarUtil().getSnackBar(
            //           context: context,
            //           message: state.signInMessage,
            //           color: Colors.red);
            //     }
            //   },
            //   child:
            Padding(
          padding: EdgeInsets.symmetric(horizontal: DoubleManager.d_16),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MainLogo(),
                    SignTypeText(signSentence: StringsManager.loginToUrAccount),
                    SignForm(
                      // signEvent: signEvent,
                      buttonText: StringsManager.signIn,
                      isSignUp: false,
                    ),
                    ForgotPasswordComponent(),
                    AuthenticationDivider(
                      text: StringsManager.authenticationDividerText,
                    ),
                    SocialSignWidget(),
                    HaveAccountWidget(
                      question: StringsManager.dontHaveAnAccount,
                      buttonText: StringsManager.signUp,
                      routeName: Routes.signUpScreenKey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }

  // this is the function used in the form helping widget that needs an Authentication event.
  SignInEvent signEvent(String email, String password) {
    return SignInEvent(
      user: UserEntity(
        email: email,
        password: password,
        firstName: '',
        lastName: '',
        phoneNumber: '',
      ),
    );
  }
}
