import 'package:flutter/material.dart';

import '../../../../../../core/resources/values_manager.dart';
import '../../../../../../core/resources/strings_manager.dart';

class PasswordForm extends StatefulWidget {
  const PasswordForm({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

bool _isVisible = true;

class _PasswordFormState extends State<PasswordForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: StringsManager.password(context),
        prefixIcon: Icon(Icons.lock, size: Theme.of(context).iconTheme.size),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() => _isVisible = !_isVisible);
          },
          icon: _isVisible
              ? Icon(Icons.visibility, size: Theme.of(context).iconTheme.size)
              : Icon(Icons.visibility_off,
                  size: Theme.of(context).iconTheme.size),
        ),
      ),
      obscureText: _isVisible,
      keyboardType: TextInputType.visiblePassword,
      controller: widget.passwordController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return StringsManager.passwordValidateMessage(context);
        } else if (value.length < IntManager.i_6) {
          return StringsManager.passwordLengthValidationMessage(context);
        }
        return null;
      },
      onSaved: (_) {
        widget.passwordController.clear();
        widget.passwordController.dispose();
      },
    );
  }
}
