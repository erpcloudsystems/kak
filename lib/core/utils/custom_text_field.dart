import 'package:flutter/material.dart';

import '../../../../../../core/resources/fonts_manager.dart';
import '../../../../../../core/resources/styles_manager.dart';
import '../../../../../../core/resources/strings_manager.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hint,
  });

  final TextEditingController controller;
  final IconData icon;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: getRegularStyle(
          fontName: FontsName.headlinesFont, fontSize: FontsSize.s16),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, size: Theme.of(context).iconTheme.size),
        hintText: hint,
      ),
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return StringsManager.emptyValidator;
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
