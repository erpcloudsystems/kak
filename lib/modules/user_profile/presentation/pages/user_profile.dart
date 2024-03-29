import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/general_background.dart';
import '../bloc/user_profile_bloc.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/utils/error_dialog.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/loading_indicator_util.dart';
import '../widgets/user_profile/user_profile_main_widget.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.profile(context)),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_square),
            iconSize: DoubleManager.d_20,
            onPressed: () =>
                Navigator.of(context).pushNamed(Routes.editProfileScreenKey),
          ),
        ],
      ),
      body: GeneralBackground(
        child: BlocConsumer<UserProfileBloc, UserProfileState>(
          listenWhen: (previous, current) =>
              previous.getUserProfileState != current.getUserProfileState,
          listener: userProfileStatesHandler,
          builder: (context, state) {
            if (state.getUserProfileState == RequestState.loading) {
              return const LoadingIndicatorUtil();
            } else if (state.getUserProfileState == RequestState.success) {
              return UserProfileMainWidget(user: state.getUserProfileData);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<UserProfileBloc>().add(GetUserProfileEvent());
  }

  void userProfileStatesHandler(context, UserProfileState state) {
    if (state.getUserProfileState == RequestState.error) {
      ErrorDialogUtils.displayErrorDialog(
        context: context,
        errorMessage: state.getUserProfileMessage,
      );
    }
  }
}
