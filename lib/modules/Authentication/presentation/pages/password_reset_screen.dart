import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/enums.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/utils/snack_bar_util.dart';
import '../bloc/regular_sign/authentication_bloc.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/top_screen_back_arrow.dart';
import '../../../../core/utils/loading_indicator_util.dart';
import '../widgets/sign_screen_components/reset_password_screen_components/reset_image.dart';
import '../widgets/sign_screen_components/reset_password_screen_components/email_and_save.dart';
import '../widgets/sign_screen_components/reset_password_screen_components/enter_email_text.dart';

class PasswordResetScreen extends StatelessWidget {
  const PasswordResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, current) =>
          previous.resetPasswordState != current.resetPasswordState,
      listener: (context, state) {
        if (state.resetPasswordState == RequestState.loading) {
          LoadingUtils.showLoadingDialog(context, LoadingType.circular);
        }
        if (state.resetPasswordState == RequestState.success) {
          Navigator.of(context).pop();
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content:  Text(
                      StringsManager.resetPasswordAlertMessage,
                      softWrap: true,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.of(context)
                              .pushReplacementNamed(Routes.signInScreenKey),
                          child:  Text(StringsManager.okay))
                    ],
                  ));
        }
        if (state.resetPasswordState == RequestState.error) {
          Navigator.of(context).pop();
          SnackBarUtil().getSnackBar(
            context: context,
            message: state.resetPasswordMessage,
            color: Colors.red,
          );
        }
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DoubleManager.d_15,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TopScreenBackArrow(
                          navigateFunction: () => Navigator.of(context)
                              .pushReplacementNamed(Routes.signInScreenKey)),
                      const ResetImage(),
                      const EnterEmailText(),
                      EmailAndSaveButton(emailController: emailController),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
