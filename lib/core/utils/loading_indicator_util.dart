import 'package:loading_indicator/loading_indicator.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../resources/values_manager.dart';
import '../resources/colors_manager.dart';

class LoadingIndicatorUtil extends StatelessWidget {
  const LoadingIndicatorUtil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: DoubleManager.d_40.h,
        width: DoubleManager.d_60.w,
        child: const LoadingIndicator(
            indicatorType: Indicator.ballClipRotatePulse,
            colors: [
              ColorsManager.mainColor,
              ColorsManager.secondaryColor,
            ]),
      ),
    );
  }
}
