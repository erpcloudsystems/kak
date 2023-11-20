import 'package:loading_indicator/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'enums.dart';
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
            indicatorType: Indicator.ballSpinFadeLoader,
            colors: [ColorsManager.mainColor]),
      ),
    );
  }
}

abstract class LoadingUtils {
  /// If you will use "Linear Loading", you must give a message in the parameters.
  static showLoadingDialog(BuildContext context, LoadingType loadingType,
          [String? message]) =>
      showDialog(
        barrierDismissible: false,
        barrierColor: Colors.grey.withOpacity(0.4),
        context: context,
        builder: (BuildContext context) => Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DoubleManager.d_15)),
          backgroundColor: Colors.white,
          insetPadding: const EdgeInsets.all(DoubleManager.d_12),
          child: WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Padding(
              padding: const EdgeInsets.all(DoubleManager.d_8),
              child: loadingType == LoadingType.linear
                  ? LinearLoading(message: message!)
                  : const CircularLoading(),
            ),
          ),
        ),
      );
}

class LinearLoading extends StatelessWidget {
  const LinearLoading({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(message),
        const Padding(
          padding: EdgeInsets.all(DoubleManager.d_16),
          child: LinearProgressIndicator(
            color: ColorsManager.mainColor,
            backgroundColor: Colors.transparent,
          ),
        )
      ],
    );
  }
}

class CircularLoading extends StatelessWidget {
  const CircularLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: DoubleManager.d_20,
      width: DoubleManager.d_50,
      child: LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,
          colors: [ColorsManager.mainColor]),
    );
  }
}
