import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'options_list.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/resources/routes.dart';
import '../../../../../core/utils/error_dialog.dart';
import '../../../../../core/utils/snack_bar_util.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/utils/loading_indicator_util.dart';
import '../../../../authentication/presentation/bloc/regular_sign/authentication_bloc.dart';
import '../../../../authentication/presentation/bloc/caching_user_data/caching_user_data_bloc.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, current) =>
          previous.deleteUserAccountState != current.deleteUserAccountState,
      listener: (context, state) {
        switch (state.deleteUserAccountState) {
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
        icon: Icons.delete_forever_outlined,
        text: StringsManager.deleteAccount,
        onTap: (context) => BlocProvider.of<AuthenticationBloc>(context).add(
            DeleteUserAccountEvent(
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
        errorMessage: state.deleteUserAccountMessage,
      ),
    );
  }

  void handleSuccessState(BuildContext context) {
    BlocProvider.of<CachingUserDataBloc>(context)
        .add(DeleteCachedUserDataEvent());
    Navigator.of(context).pop();
    SnackBarUtil().getSnackBar(
      context: context,
      message: StringsManager.deleteAccountMessage,
      color: Colors.green,
    );
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.signInScreenKey, (route) => false);
  }
}
