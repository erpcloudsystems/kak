import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'delivery_address_component.dart';
import '../../../domain/entities/address.dart';
import '../../../../../core/resources/values_manager.dart';

class DeliveryAddressesSuccessComponent extends StatelessWidget {
  const DeliveryAddressesSuccessComponent({
    super.key,
    required this.addresses,
  });

  final List<AddressEntity> addresses;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: addresses.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 1000),
            child: SlideAnimation(
              verticalOffset: DoubleManager.d_90.h,
              curve: Curves.decelerate,
              child: FadeInAnimation(
                child: DeliveryAddressComponent(
                  address: addresses[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
