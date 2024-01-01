import 'package:flutter/material.dart';

import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/strings_manager.dart';

class AddressFormField extends StatefulWidget {
  const AddressFormField({
    required this.controller,
    this.optional = false,
    required this.hint,
    super.key,
  });

  final TextEditingController controller;
  final String hint;
  final bool optional;

  @override
  State<AddressFormField> createState() => _AddressFormFieldState();
}

class _AddressFormFieldState extends State<AddressFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: DoubleManager.d_10),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DoubleManager.d_10),
            borderSide: const BorderSide(color: ColorsManager.gGrey),
          ),
          hintText: widget.hint,
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
          if (value == null || value.isEmpty && !widget.optional) {
            return StringsManager.emptyValidator(context);
          }
          return null;
        },
      ),
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
