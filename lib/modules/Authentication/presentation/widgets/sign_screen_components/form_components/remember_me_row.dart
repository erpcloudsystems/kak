import 'package:flutter/material.dart';

import 'remember_me_check_box.dart';
import '../../../../../../core/resources/fonts_manager.dart';
import '../../../../../../core/resources/strings_manager.dart';

class RememberMeRow extends StatelessWidget {
  final TextEditingController emailController;
  const RememberMeRow({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RememberMeCheckBox(emailController: emailController),
        Text(
          StringsManager.rememberMe(context),
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: FontsSize.s12,
              ),
        ),
      ],
    );
  }
}
