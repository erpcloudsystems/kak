import 'package:flutter/material.dart';

import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/resources/styles_manager.dart';

class DateFormPicker extends StatefulWidget {
  const DateFormPicker({
    required this.dateController,
    required this.hint,
    super.key,
  });

  final TextEditingController dateController;
  final String hint;

  @override
  State<DateFormPicker> createState() => _DateFormPickerState();
}

class _DateFormPickerState extends State<DateFormPicker> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.dateController.text =
            "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () => _selectDate(context),
      controller: widget.dateController,
      onSaved: (_) {
        widget.dateController.clear();
        widget.dateController.dispose();
      },
      style: getRegularStyle(
          fontName: FontsName.detailsFont, fontSize: FontsSize.s16),
      readOnly: true,
      validator: (value) {
        if (value == null) {
          return StringsManager.emptyValidator;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.hint,
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.calendar_today),
      ),
    );
  }
}
