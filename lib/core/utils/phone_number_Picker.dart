import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';

class PhoneNumberPicker extends StatelessWidget {
  const PhoneNumberPicker({super.key, required this.phoneNumber, this.initialValue});
  
  final Function phoneNumber;
  final String? initialValue;

  @override
  Widget build(BuildContext context) => IntlPhoneField(
      keyboardType: TextInputType.phone,
      initialCountryCode: 'EG',
      initialValue: initialValue,
      onChanged: (value) => phoneNumber(value.completeNumber));
}
