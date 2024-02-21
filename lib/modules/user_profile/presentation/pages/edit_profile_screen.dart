import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../bloc/user_profile_bloc.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/utils/error_dialog.dart';
import '../../../../core/utils/snack_bar_util.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/utils/general_background.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/loading_indicator_util.dart';
import '../widgets/user_profile/edit_profile_main_screen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(StringsManager.editProfile(context))),
      body: GeneralBackground(
        child: BlocConsumer<UserProfileBloc, UserProfileState>(
          listenWhen: (previous, current) =>
              previous.editUserProfileState != current.editUserProfileState,
          listener: (context, state) {
            switch (state.editUserProfileState) {
              case RequestState.loading:
                LoadingUtils.showLoadingDialog(
                  context,
                  LoadingType.linear,
                  StringsManager.updatingYourProfile(context),
                );
                break;
              case RequestState.success:
                SnackBarUtil().getSnackBar(
                    context: context,
                    message: StringsManager.profileUpdated(context),
                    color: ColorsManager.gGreen);
                context.read<UserProfileBloc>().add(GetUserProfileEvent());
                Navigator.of(context).popUntil(
                  (route) => route.settings.name == Routes.userProfileScreenKey,
                );
                break;
              case RequestState.error:
                Navigator.of(context).pop();
                ErrorDialogUtils.displayErrorDialog(
                    context: context,
                    errorMessage: state.editUserProfileMessage);
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
      ),
    );
  }
}
