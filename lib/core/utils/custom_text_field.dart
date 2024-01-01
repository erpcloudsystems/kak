import 'package:flutter/material.dart';

import '../../../../../../core/resources/strings_manager.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.hint,
    this.icon,
    super.key,
  });

  final TextEditingController controller;
  final IconData? icon;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, size: Theme.of(context).iconTheme.size),
        hintText: hint,
      ),
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return StringsManager.emptyValidator(context);
        }
        return null;
      },
      onSaved: (_) {
        controller.clear();
        controller.dispose();
      },
    );
  }
}
