import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../resources/assetss_path.dart';
import '../resources/values_manager.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    super.key,
    required this.url,
    this.height,
    this.width,
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
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: DoubleManager.d_170,
          width: DoubleManager.d_120,
          decoration: const BoxDecoration(color: Colors.white),
        ),
      ),
      errorWidget: (context, url, error) => Image.asset(ImagesPath.logoPath),
    );
  }
}
