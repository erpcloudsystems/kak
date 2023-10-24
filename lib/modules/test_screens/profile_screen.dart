import 'package:flutter/material.dart';

import '../../core/resources/strings_manager.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(StringsManager.profile)),
      body: const SizedBox(),
    );
  }
}
