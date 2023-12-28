import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/resources/routes.dart';
import '../../../../../core/network/api_constance.dart';
import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/utils/custom_cached_image.dart';
import '../../../../../core/resources/strings_manager.dart';

class MapSnapshotSection extends StatelessWidget {
  const MapSnapshotSection({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.fullAddress,
  });

  final String latitude, longitude, fullAddress;
  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          // map snapshot
          CustomCachedImage(
            url: ApiConstance.getMapSnapshot(
              context,
              latitude,
              longitude,
            ),
            height: DoubleManager.d_20.h,
            width: double.infinity,
          ),

          // address details
          Positioned(
            bottom: -DoubleManager.d_20,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: DoubleManager.d_3,
                horizontal: DoubleManager.d_12,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: DoubleManager.d_5,
                    spreadRadius: DoubleManager.d_1,
                    offset: Offset(DoubleManager.d_3, DoubleManager.d_3),
                  )
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Location icon
                  const Icon(Icons.location_on_rounded),
                  SizedBox(
                    width: DoubleManager.d_70.w,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: DoubleManager.d_8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Area
                          Text(
                            StringsManager.area,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: FontsSize.s10),
                          ),

                          // Address
                          Flexible(
                            child: Text(
                              fullAddress,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: FontsSize.s10,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Change Button
                  TextButton(
                      onPressed: () => Navigator.of(context)
                          .pushReplacementNamed(Routes.mapScreenKey),
                      child: const Text(StringsManager.change))
                ],
              ),
            ),
          ),
        ]);
  }
}
