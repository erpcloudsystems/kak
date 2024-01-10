import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kak/core/resources/colors_manager.dart';
import 'package:kak/core/resources/routes.dart';
import 'package:kak/core/utils/enums.dart';
import 'package:kak/core/utils/error_dialog.dart';
import 'package:kak/core/utils/loading_indicator_util.dart';
import 'package:kak/core/utils/snack_bar_util.dart';

import '../bloc/user_profile_bloc.dart';
import '../widgets/user_profile/edit_profile_main_screen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit profile')),
      body: BlocConsumer<UserProfileBloc, UserProfileState>(
        listenWhen: (previous, current) =>
            previous.editUserProfileState != current.editUserProfileState,
        listener: (context, state) {
          switch (state.editUserProfileState) {
            case RequestState.loading:
              LoadingUtils.showLoadingDialog(
                  context, LoadingType.linear, 'Updating your profile');
              break;
            case RequestState.success:
              SnackBarUtil().getSnackBar(
                  context: context,
                  message: 'Your profile updated successfully',
                  color: ColorsManager.gGreen);
              context.read<UserProfileBloc>().add(GetUserProfileEvent());
              Navigator.of(context).popUntil(
                (route) => route.settings.name == Routes.userProfileScreenKey,
              );
              break;
            case RequestState.error:
              Navigator.of(context).pop();
              ErrorDialogUtils.displayErrorDialog(
                  context: context, errorMessage: state.editUserProfileMessage);
              break;
            default:
          }
        },
        builder: (context, state) {
          return EditUserProfileMainScreen(
            userOldData: state.getUserProfileData,
          );
        },
      ),
    );
  }
}
