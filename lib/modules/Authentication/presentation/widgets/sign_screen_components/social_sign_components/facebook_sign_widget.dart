import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/enums.dart';
import '../../../bloc/social_sign/social_sign_bloc.dart';
import '../../../../../../core/utils/snack_bar_util.dart';
import '../../../../../../core/global/global_varibles.dart';
import '../../../bloc/regular_sign/authentication_bloc.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/utils/loading_indicator_util.dart';

class FacebookSignWidget extends StatelessWidget {
  final Widget facebookSignView;
  const FacebookSignWidget({super.key, required this.facebookSignView});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialSignBloc, SocialSignState>(
      listenWhen: (previous, current) =>
          previous.facebookSignState != current.facebookSignState,
      listener: (context, state) {
        if (state.facebookSignState == RequestState.error) {
          SnackBarUtil().getSnackBar(
            context: context,
            color: ColorsManager.gRed,
            message: state.facebookSignMessage,
          );
        }
        if (state.facebookSignState == RequestState.success) {
          // Here we save the user password in the global variables to use it with auto-login
          // and make the choice be true to be remembered, and then call the event.
          final gv = GlobalVariables();
          final user = state.facebookUserData;
          gv.setGlobalUserPassword = state.facebookUserData.password;
          gv.setUserDecision = true;
          context.read<AuthenticationBloc>().add(SignBySocialEvent(user: user));
        }
      },
      buildWhen: (previous, current) =>
          previous.facebookSignState != current.facebookSignState,
      builder: (context, state) {
        if (state.facebookSignState == RequestState.loading) {
          return const SizedBox.square(
            dimension: DoubleManager.d_40,
            child: LoadingIndicatorUtil(),
          );
        }
        return facebookSignView;
      },
    );
  }
}
