import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/enums.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/utils/error_dialog.dart';
import '../../../../core/utils/snack_bar_util.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/loading_indicator_util.dart';
import '../../../authentication/domain/entities/user.dart';
import '../../../authentication/presentation/bloc/regular_sign/authentication_bloc.dart';
import '../widgets/sign_screen_components/form_components/sign_form.dart';
import '../widgets/sign_screen_components/sign_screens_shared_components/main_logo.dart';
import '../widgets/sign_screen_components/social_sign_components/social_sign_widget.dart';
import '../widgets/sign_screen_components/sign_screens_shared_components/sign_type_text.dart';
import '../widgets/sign_screen_components/sign_screens_shared_components/have_account_widget.dart';
import '../widgets/sign_screen_components/sign_screens_shared_components/authentication_divider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<AuthenticationBloc, AuthenticationState>(
          listenWhen: (previous, current) =>
              previous.signUpState != current.signUpState,
          listener: (context, state) {
            if (state.signUpState == RequestState.success) {
              Navigator.of(context).pop();
              SnackBarUtil().getSnackBar(
                  context: context,
                  message: StringsManager.createdAccountSuccessfully(context),
                  color: Colors.green);
              Navigator.of(context)
                  .pushReplacementNamed(Routes.signInScreenKey);
            }

            if (state.signUpState == RequestState.error) {
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (BuildContext context) => ErrorDialog(
                  errorMessage: state.signUpMessage,
                ),
              );
            }
            if (state.signUpState == RequestState.loading) {
              LoadingUtils.showLoadingDialog(context, LoadingType.circular);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: DoubleManager.d_16),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const MainLogo(),
                       SignTypeText(signSentence: StringsManager.create(context)),
                      SignForm(
                        signEvent: signEvent,
                        buttonText: StringsManager.signUp(context),
                        isSignUp: true,
                      ),
                       AuthenticationDivider(
                          text: StringsManager.authenticationDividerText(context)),
                      const SocialSignWidget(),
                       HaveAccountWidget(
                        buttonText: StringsManager.signIn(context),
                        question: StringsManager.alreadyHaveAnAccount(context),
                        routeName: Routes.signInScreenKey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // this is the function used in the form helping widget that needs an Authentication event.
  SignUpEvent signEvent(UserEntity user) => SignUpEvent(user: user);
}
