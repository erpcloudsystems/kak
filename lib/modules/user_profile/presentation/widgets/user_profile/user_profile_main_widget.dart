import 'package:flutter/material.dart';

import 'user_profile_card.dart';
import '../../../domain/entities/user_profile.dart';
import '../logged_components/user_profile_photo.dart';
import '../../../../../core/resources/strings_manager.dart';

class UserProfileMainWidget extends StatelessWidget {
  final UserProfileEntity user;
  const UserProfileMainWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      //_________________________User Image and Name______________________
      Center(child: UserProfilePhotoWidget(imageUrl: user.image)),
      //_________________________User Name________________________________
      UserProfileCard(
        title: StringsManager.userName(context),
        subtitle: '${user.firstName} ${user.lastName}',
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
        subtitle: user.address,
        icon: Icons.location_city_rounded,
      ),
    ]);
  }
}
