import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/resources/values_manager.dart';
import '../../../../../../core/resources/assetss_path.dart';

class MainLogo extends StatelessWidget {
  const MainLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      width: DoubleManager.d_100.w,
      height: DoubleManager.d_20.h,
      fit: BoxFit.fill,
      ImagesPath.logoPath,
    );
  }
}
