import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    super.key,
    Widget? title,
    super.onSaved,
    super.validator,
    super.initialValue = false,
    bool autoValidate = false,
    required bool? value,
    required void Function(bool?)? onChanged,
    OutlinedBorder? checkboxShape,
  }) : super(
            builder: (FormFieldState<bool> state) {
              return CheckboxListTile(
                dense: state.hasError,
                title: title,
                value: initialValue ?? value,
                onChanged: onChanged,
                subtitle: state.hasError
                    ? Builder(
                        builder: (BuildContext context) => Text(
                          state.errorText ?? "",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.error),
                        ),
                      )
                    : null,
                controlAffinity: ListTileControlAffinity.leading,
                checkboxShape: checkboxShape,
              );
            });
}
