import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/utils/enums.dart';
import '../../../../../../core/resources/routes.dart';
import '../../../bloc/social_sign/social_sign_bloc.dart';
import '../../../../../../core/utils/snack_bar_util.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../../core/utils/loading_indicator_util.dart';

class GoogleSignWidget extends StatelessWidget {
  final Widget googleSignView;
  const GoogleSignWidget({super.key, required this.googleSignView});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialSignBloc, SocialSignState>(
      listenWhen: (previous, current) =>
          previous.googleSignState != current.googleSignState,
      listener: (context, state) {
        if (state.googleSignState == RequestState.error) {
          SnackBarUtil().getSnackBar(
              context: context,
              message: state.googleSignMessage,
              color: Colors.red);
        }
        if (state.googleSignState == RequestState.success) {
             SnackBarUtil().getSnackBar(
              context: context,
              message: 'Success sign with Google!',
              color: Colors.green);
          // BlocProvider.of<CachingUserDataBloc>(context).add(
          //   CacheUserDataEvent(userEmail: state.googleUserData.email),
          // );
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Routes.navigationBarScreenKey, (route) => false);
        }
      },
      buildWhen: (previous, current) =>
          previous.googleSignState != current.googleSignState,
      builder: (context, state) {
        if (state.googleSignState == RequestState.loading) {
          return SizedBox(
              height: DoubleManager.d_5.h,
              width: DoubleManager.d_10.w,
              child: const LoadingIndicatorUtil());
        }
        return googleSignView;
      },
    );
  }
}
