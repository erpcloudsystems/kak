import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../resources/fonts_manager.dart';
import '../resources/values_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/strings_manager.dart';

class CountryPicker extends StatefulWidget {
  const CountryPicker({
    required this.countryController,
    super.key,
  });

  final TextEditingController countryController;

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  String? _selectedCountry;

  void showPicker() => showCountryPicker(
        context: context,
        favorite: const <String>['SA'],
        showPhoneCode: false,
        onSelect: (Country country) {
          if (country.name != _selectedCountry) {
            setState(() {
              _selectedCountry = country.name;
              widget.countryController.text = _selectedCountry!;
            });
          }
        },
        countryListTheme:  CountryListThemeData(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(DoubleManager.d_40),
            topRight: Radius.circular(DoubleManager.d_40),
          ),
          inputDecoration: InputDecoration(
            hintText: StringsManager.selectUrTerritory,
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.search),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () => showPicker(),
      controller: widget.countryController,
      onSaved: (_) {
        widget.countryController.clear();
        widget.countryController.dispose();
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
      decoration:  InputDecoration(
        hintText: StringsManager.territory,
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.location_city),
      ),
    );
  }
}
