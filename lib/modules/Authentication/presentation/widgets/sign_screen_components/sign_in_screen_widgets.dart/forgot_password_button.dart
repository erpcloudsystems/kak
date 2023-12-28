import 'package:flutter/material.dart';

import '../../../../../../core/resources/routes.dart';
import '../../../../../../core/resources/strings_manager.dart';

class ForgotPasswordComponent extends StatelessWidget {
  const ForgotPasswordComponent({super.key});
  @override
  Widget build(BuildContext context) {
  
    return Center(
      child: TextButton(
        onPressed: () => Navigator.of(context).pushNamed(Routes.passwordResetScreenKey),
        child:  Text(StringsManager.forgotPassword),
      ),
    );
  }
}
