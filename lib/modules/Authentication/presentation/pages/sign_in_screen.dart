import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/enums.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/utils/error_dialog.dart';
import '../../../../core/global/global_varibles.dart';

import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/loading_indicator_util.dart';
import '../../../authentication/domain/entities/user.dart';
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
    final globalVariables = GlobalVariables();

    // Here we check if the user has navigated from cart screen so we pop back to it.
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    bool fromCart = args?['fromCart'] ?? false;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<AuthenticationBloc, AuthenticationState>(
          listenWhen: (previous, current) =>
              previous.signInState != current.signInState,
          listener: (context, state) {
            if (state.signInState == RequestState.success) {
              if (globalVariables.getUserDecision == true) {
                BlocProvider.of<CachingUserDataBloc>(context)
                    .add(CacheUserDataEvent(
                        userData: UserCachingDataEntity(
                  email: state.loggedInUser.email!,
                  password: globalVariables.getGlobalUserPassword!,
                )));
              }
              globalVariables.setSid = state.loggedInUser.sid!;
              Navigator.of(context).pop();

              fromCart
                  ? Navigator.of(context).popUntil((route) =>
                      route.settings.name == Routes.navigationBarScreenKey)
                  : Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.navigationBarScreenKey, (route) => false);
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
          },
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
                            signSentence: StringsManager.loginToUrAccount),
                        SignForm(
                          signEvent: signEvent,
                          buttonText: StringsManager.signIn,
                          isSignUp: false,
                        ),
                        const ForgotPasswordComponent(),
                         AuthenticationDivider(
                          text: StringsManager.authenticationDividerText,
                        ),
                        const SocialSignWidget(),
                         HaveAccountWidget(
                          question: StringsManager.dontHaveAnAccount,
                          buttonText: StringsManager.signUp,
                          routeName: Routes.signUpScreenKey,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  // this is the function used in the form helping widget that needs an Authentication event.
  SignInEvent signEvent(UserEntity user) => SignInEvent(user: user);
}
