import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/resources/assetss_path.dart';
import '../../../../../../core/resources/values_manager.dart';

class MainLogo extends StatelessWidget {
  const MainLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      width: DoubleManager.d_80.w,
      height: DoubleManager.d_25.h,
      fit: BoxFit.fitWidth,
      ImagesPath.logoPath,
    );
  }
}
