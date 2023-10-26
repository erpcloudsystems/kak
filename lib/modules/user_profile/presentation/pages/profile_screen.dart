import 'package:flutter/material.dart';

import '../widgets/photo_widget.dart';
import '../widgets/user_name_section.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/custom_scrolling_animated_template.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(StringsManager.profile)),
      body: const CustomScrollingAnimatedTemplate(children: [
        UserPhotoWidget(),
        UserNameSection(),
      ]),
    );
  }
}