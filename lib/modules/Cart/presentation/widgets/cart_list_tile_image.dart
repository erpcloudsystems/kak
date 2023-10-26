import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/loading_indicator_util.dart';

class CartListTileImage extends StatelessWidget {
  final String imageUrl;

  const CartListTileImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DoubleManager.d_30.h,
      width: DoubleManager.d_20.w,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(.2)),
      child: CachedNetworkImage(
        fadeInCurve: Curves.easeIn,
        fadeInDuration: const Duration(milliseconds: IntManager.i_500),
        progressIndicatorBuilder: (context, url, progress) =>
            const LoadingIndicatorUtil(),
        imageUrl: imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
