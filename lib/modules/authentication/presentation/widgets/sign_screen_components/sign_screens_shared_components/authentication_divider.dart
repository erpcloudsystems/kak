import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/resources/values_manager.dart';

class AuthenticationDivider extends StatelessWidget {
  final String text;
  const AuthenticationDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: DoubleManager.d_1.h),
      child: Row(
        children: [
          const DividerLine(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: DoubleManager.d_2.w),
            child:
                Text(text, style: Theme.of(context).textTheme.headlineMedium),
          ),
          const DividerLine(),
        ],
      ),
    );
  }
}

class DividerLine extends StatelessWidget {
  const DividerLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(color: Colors.grey, height: .5),
    );
  }
}
