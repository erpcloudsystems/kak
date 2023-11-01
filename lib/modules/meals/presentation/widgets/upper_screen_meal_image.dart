import 'package:flutter/material.dart';

import '../../../../core/utils/custom_cached_image.dart';

class UpperScreenMealImage extends StatelessWidget {
  const UpperScreenMealImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (rect) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.black,
            ],
            stops: [0, 0.3, 0.5, 1],
          ).createShader(
            Rect.fromLTRB(0, 0, rect.width, rect.height),
          );
        },
        blendMode: BlendMode.dstIn,
        child: CustomCachedImage(
          url: imageUrl,
          width: double.infinity,
        ));
  }
}
