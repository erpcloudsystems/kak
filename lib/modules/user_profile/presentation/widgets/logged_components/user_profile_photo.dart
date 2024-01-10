import 'package:flutter/material.dart';

import '../user_profile/user_photo_widget.dart';
import '../../../../../core/network/api_constance.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/utils/custom_cached_image.dart';

class UserProfilePhotoWidget extends StatelessWidget {
  const UserProfilePhotoWidget({super.key, this.imageUrl});

  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DoubleManager.d_20),
      child: UserPhotoWidget(
        child: ClipOval(
            child: CustomCachedImage(
          url: imageUrl != null
              ? '${ApiConstance.kakUrl}$imageUrl'
              : userTestImage,
        )),
      ),
    );
  }
}

const String userTestImage =
    'https://img.freepik.com/premium-vector/anonymous-user-circle-icon-vector-illustration-flat-style-with-long-shadow_520826-1931.jpg';
