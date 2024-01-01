import 'package:flutter/material.dart';

import '../../../../../../core/resources/extensions.dart';
import '../../../../../../core/resources/strings_manager.dart';

class EmailForm extends StatelessWidget {
  const EmailForm({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email, size: Theme.of(context).iconTheme.size),
        hintText: StringsManager.email(context),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || !value.isEmailValid()) {
          return StringsManager.emailValidateMessage(context);
        }
        return null;
      },
      onSaved: (_) {
        emailController.clear();
        emailController.dispose();
      },
    );
  }
}
