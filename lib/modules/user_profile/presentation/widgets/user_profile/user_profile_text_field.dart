import 'package:flutter/material.dart';
import 'package:mumo/core/resources/colors_manager.dart';

import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/utils/custom_text_field.dart';

class UserProfileTextField extends StatelessWidget {
  const UserProfileTextField(
      {super.key, required this.controller, required this.fieldName});

  final TextEditingController controller;
  final String fieldName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          fieldName,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: ColorsManager.mainColor),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: DoubleManager.d_10),
            child: CustomTextField(controller: controller, hint: '')),
      ],
    );
  }
}
