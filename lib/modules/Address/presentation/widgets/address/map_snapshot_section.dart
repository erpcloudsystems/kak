import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:typed_data';

import '../../bloc/address_bloc.dart';
import '../../../../../core/resources/routes.dart';
import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/strings_manager.dart';

class MapSnapshotSection extends StatelessWidget {
  const MapSnapshotSection({
    super.key,
    required this.mapSnapshot,
  });

  final Uint8List mapSnapshot;

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          // map snapshot
          Image.memory(
            mapSnapshot,
            height: DoubleManager.d_20.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
    
          // address details
          Positioned(
            bottom: -DoubleManager.d_40,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: DoubleManager.d_8,
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
                    offset:
                        Offset(DoubleManager.d_3, DoubleManager.d_3),
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
                              context
                                  .watch<AddressBloc>()
                                  .state
                                  .getAddressMessage,
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
    
                  // Button
                  SizedBox(
                    width: DoubleManager.d_15.w,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: TextButton(
                          onPressed: () => Navigator.of(context)
                              .pushReplacementNamed(
                                  Routes.mapScreenKey),
                          child: const Text(StringsManager.change)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]);
  }
}