import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'options_list.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/resources/routes.dart';
import '../../../../../core/utils/error_dialog.dart';
import '../../../../../core/utils/snack_bar_util.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/utils/loading_indicator_util.dart';
import '../../../../authentication/presentation/bloc/regular_sign/authentication_bloc.dart';
import '../../../../authentication/presentation/bloc/caching_user_data/caching_user_data_bloc.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, current) =>
          previous.logoutState != current.logoutState,
      listener: (context, state) {
        switch (state.logoutState) {
          case RequestState.loading:
            LoadingUtils.showLoadingDialog(context, LoadingType.circular);
          case RequestState.error:
            showErrorMessage(context, state);
          case RequestState.success:
            handleSuccessState(context);
          case RequestState.stable:
            return;
        }
      },
      child: ProfileListElement(
        icon: Icons.logout,
        text: StringsManager.logout(context),
        onTap: (context) => BlocProvider.of<AuthenticationBloc>(context).add(
            LogoutEvent(
                email: context
                    .read<AuthenticationBloc>()
                    .state
                    .loggedInUser
                    .email!)),
      ),
    );
  }

  Future<dynamic> showErrorMessage(
      BuildContext context, AuthenticationState state) {
    Navigator.of(context).pop();
    return showDialog(
      context: context,
      builder: (BuildContext context) => ErrorDialog(
        errorMessage: state.logoutMessage,
      ),
    );
  }

  void handleSuccessState(BuildContext context) {
    BlocProvider.of<CachingUserDataBloc>(context)
        .add(DeleteCachedUserDataEvent());
    Navigator.of(context).pop();
    SnackBarUtil().getSnackBar(
      context: context,
      message: StringsManager.logoutMessage(context),
      color: ColorsManager.gGreen,
    );
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.navigationBarScreenKey,
      (route) => false,
    );
  }
}
