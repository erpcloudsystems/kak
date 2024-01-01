import 'package:flutter/material.dart';

import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/resources/styles_manager.dart';

class CustomDropDownFormField extends StatefulWidget {
  const CustomDropDownFormField({
    super.key,
    required this.selectedValue,
    required this.dropDownList,
    required this.hint,
    this.prefixIcon,
  });

  final List<String> dropDownList;
  final Function selectedValue;
  final IconData? prefixIcon;
  final String hint;

  @override
  State<CustomDropDownFormField> createState() =>
      _CustomDropDownFormFieldState();
}

class _CustomDropDownFormFieldState extends State<CustomDropDownFormField> {
  String? _selected;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: Text(widget.hint),
      style: getRegularStyle(
          fontName: FontsName.detailsFont, fontSize: FontsSize.s16),
      validator: (value) {
        if (value == null) {
          return StringsManager.emptyValidator(context);
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(widget.prefixIcon),
        border: const OutlineInputBorder(),
      ),
      value: _selected,
      items: widget.dropDownList.map((e) {
        return DropdownMenuItem<String>(
          value: e,
          child: Text(e),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selected = newValue;
          widget.selectedValue(_selected);
        });
      },
    );
  }
}
