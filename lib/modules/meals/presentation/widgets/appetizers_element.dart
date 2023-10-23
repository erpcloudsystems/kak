import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/images_path.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/loading_indicator_util.dart';

class AppetizersElement extends StatelessWidget {
  const AppetizersElement({
    required this.imageUrl,
    super.key,
  });

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // TODO: Navigate to Item Group.
      onTap: () {},
      child: CircleAvatar(
          radius: DoubleManager.d_40,
          backgroundColor: Colors.white,
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) =>
                  Image.asset(ImagesPath.logoPath),
              progressIndicatorBuilder: (context, url, progress) =>
                  const LoadingIndicatorUtil(),
            ),
          )),
    );
  }
}
