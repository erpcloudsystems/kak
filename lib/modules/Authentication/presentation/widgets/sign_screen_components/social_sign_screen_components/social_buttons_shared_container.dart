import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/resources/values_manager.dart';
import '../../../../../../core/resources/strings_manager.dart';

class SocialButtonsSharedContainer extends StatelessWidget {
  const SocialButtonsSharedContainer({
    super.key,
    required this.icon,
    required this.signType,
  });

  final IconData icon;
  final String signType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(DoubleManager.d_10.sp),
        border: Border.all(
          width: DoubleManager.d_05,
          color: Colors.grey.withOpacity(
            DoubleManager.d_05,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(DoubleManager.d_5.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.red),
            SizedBox(width: DoubleManager.d_3.w),
            Text('${StringsManager.continueWith} $signType',
                style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}
