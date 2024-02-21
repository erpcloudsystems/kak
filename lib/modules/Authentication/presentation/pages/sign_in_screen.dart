import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/enums.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/utils/error_dialog.dart';
import '../../../../core/global/global_varibles.dart';
import '../../../../core/utils/general_background.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../authentication/domain/entities/user.dart';
import '../../../../core/utils/loading_indicator_util.dart';
import '../../domain/entities/user_caching_data_entity.dart';
import '../bloc/caching_user_data/caching_user_data_bloc.dart';
import '../widgets/sign_screen_components/form_components/sign_form.dart';
import '../../../authentication/presentation/bloc/regular_sign/authentication_bloc.dart';
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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GeneralBackground(
          child: BlocListener<AuthenticationBloc, AuthenticationState>(
            listenWhen: (previous, current) =>
                previous.signInState != current.signInState,
            listener: loginHandlerMethod,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: DoubleManager.d_16),
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const MainLogo(),
                          SignTypeText(
                              signSentence:
                                  StringsManager.loginToUrAccount(context)),
                          SignForm(
                            signEvent: signEvent,
                            buttonText: StringsManager.signIn(context),
                            isSignUp: false,
                          ),
                          const ForgotPasswordComponent(),
                          AuthenticationDivider(
                            text:
                                StringsManager.authenticationDividerText(context),
                          ),
                          const SocialSignWidget(),
                          HaveAccountWidget(
                            question: StringsManager.dontHaveAnAccount(context),
                            buttonText: StringsManager.signUp(context),
                            routeName: Routes.signUpScreenKey,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  // this is the function used in the form helping widget that needs an Authentication event.
  SignInEvent signEvent(UserEntity user) => SignInEvent(user: user);

  /// This method to listen to the login state changes as we use it although with the social sign.
  static void loginHandlerMethod(
      BuildContext context, AuthenticationState state) {
    final gv = GlobalVariables();
    if (state.signInState == RequestState.success) {
      if (gv.getUserDecision == true) {
        BlocProvider.of<CachingUserDataBloc>(context).add(CacheUserDataEvent(
            userData: UserCachingDataEntity(
          email: state.loggedInUser.email!,
          password: gv.getGlobalUserPassword!,
        )));
      }
      gv.setSid = state.loggedInUser.sid!;
      Navigator.of(context).popUntil(
          (route) => route.settings.name == Routes.navigationBarScreenKey);
    }

    if (state.signInState == RequestState.error) {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (BuildContext context) => ErrorDialog(
          errorMessage: state.signInMessage,
        ),
      );
    }
    if (state.signInState == RequestState.loading) {
      LoadingUtils.showLoadingDialog(context, LoadingType.circular);
    }
  }
}
