import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../resources/images_path.dart';
import 'loading_indicator_util.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    super.key,
    required this.url, this.height, this.width,
  });

  final String url;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, progress) => const LoadingIndicatorUtil(),
      errorWidget:(context, url, error) => Image.asset(ImagesPath.logoPath),
    );
  }
}
