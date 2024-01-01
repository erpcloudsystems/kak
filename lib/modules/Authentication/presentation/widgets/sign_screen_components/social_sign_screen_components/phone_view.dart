import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'social_buttons_shared_container.dart';
import '../../../../../../core/resources/strings_manager.dart';
import '../../../../../../core/resources/values_manager.dart';

class SignScreenPhoneView extends StatelessWidget {
  const SignScreenPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         SocialButtonsSharedContainer(
            icon: FontAwesomeIcons.phone, signType: StringsManager.phone(context)),
        ClipRRect(
          borderRadius: BorderRadius.circular(DoubleManager.d_10.sp),
          child: Container(
            height: DoubleManager.d_8.h,
            width: double.infinity,
            color: Colors.grey.withOpacity(
              DoubleManager.d_005,
            ),
          ),
        ),
      ],
    );
  }
}
