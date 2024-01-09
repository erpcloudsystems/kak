import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_profile_bloc.dart';
import '../widgets/user_profile/edit_profile_main_screen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit profile')),
      body: EditUserProfileMainScreen(
        userOldData: context.read<UserProfileBloc>().state.getUserProfileData,
      ),
    );
  }
}
