import 'package:flutter/material.dart';

import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/strings_manager.dart';

class AddressFormField extends StatelessWidget {
  const AddressFormField({
    required this.controller,
    required this.hint,
    super.key,
  });

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DoubleManager.d_10),
          borderSide: const BorderSide(color: ColorsManager.gGrey),
        ),
        hintText: hint,
        hintStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(fontSize: FontsSize.s14),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: DoubleManager.d_20,
          vertical: DoubleManager.d_15,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return StringsManager.emptyValidator;
        }
        return null;
      },
    );
  }
}
