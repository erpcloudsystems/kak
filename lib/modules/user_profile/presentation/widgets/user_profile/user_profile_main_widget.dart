import 'package:flutter/material.dart';

import 'user_profile_card.dart';
import '../logged_components/photo_widget.dart';
import '../../../domain/entities/user_profile.dart';
import '../../../../../core/resources/strings_manager.dart';

class UserProfileMainWidget extends StatelessWidget {
  final UserProfileEntity user;
  const UserProfileMainWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      //_________________________User Image and Name______________________
      const Center(child: UserPhotoWidget()),
      //_________________________User Image and Name______________________
      UserProfileCard(
        title: StringsManager.userName(context),
        subtitle: user.name,
        icon: Icons.person,
      ),
      // ________________________________User Email________________________________
      UserProfileCard(
        title: StringsManager.email(context),
        subtitle: user.email,
        icon: Icons.email_outlined,
      ),

      //_____________________________User Mobile _____________________________
      UserProfileCard(
        title: StringsManager.phone(context),
        subtitle: user.mobileNo,
        icon: Icons.phone_android,
      ),

      //________________________ Default address ______________________________
      UserProfileCard(
        title: StringsManager.primaryAddress(context),
        subtitle: 'Default address placeholder',
        icon: Icons.location_city_rounded,
      ),
    ]);
  }
}
