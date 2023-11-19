import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/resources/fonts_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../../core/resources/colors_manager.dart';

class SignTypeText extends StatelessWidget {
  final String signSentence;
  const SignTypeText({required this.signSentence, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: DoubleManager.d_2.h),
      child: Text(
        signSentence,
        style: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(fontSize: FontsSize.s22, color: ColorsManager.mainColor),
      ),
    );
  }
}
