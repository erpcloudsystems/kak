import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../bloc/address/address_bloc.dart';
import '../../../domain/entities/address.dart';
import '../../../../../core/resources/routes.dart';
import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/strings_manager.dart';

class DeliveryAddressComponent extends StatelessWidget {
  const DeliveryAddressComponent({
    super.key,
    required this.address,
    this.isDismissed,
  });

  final AddressEntity address;
  final bool? isDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(address.id!),
      confirmDismiss: (_) async {
        context
            .read<AddressBloc>()
            .add(DeleteAddressEvent(addressId: address.id!));
        return isDismissed;
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(DoubleManager.d_20),
        margin: const EdgeInsets.all(DoubleManager.d_20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DoubleManager.d_12),
          color: Colors.redAccent,
        ),

        // Dismissible icon
        child: const Icon(
          Icons.delete,
          size: DoubleManager.d_25,
          color: ColorsManager.gWhite,
        ),
      ),
      child: InkWell(
        onTap: () {
          context
              .read<AddressBloc>()
              .add(SaveAddressIdEvent(addressId: address.id!));
          Navigator.of(context).pushNamed(
            Routes.checkoutScreenKey,
            arguments: address,
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            side: address.isDefaultAddress
                ? const BorderSide(
                    color: ColorsManager.swatchRed, width: DoubleManager.d_2)
                : BorderSide.none,
            borderRadius: const BorderRadius.all(
              Radius.circular(DoubleManager.d_12),
            ),
          ),
          margin: const EdgeInsets.symmetric(
              horizontal: DoubleManager.d_20, vertical: DoubleManager.d_10),
          elevation: DoubleManager.d_5,
          child: Padding(
            padding: const EdgeInsets.all(DoubleManager.d_10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Location icon
                    const Icon(Icons.location_pin, size: DoubleManager.d_25),
                    const SizedBox(width: DoubleManager.d_10),

                    // Address title
                    Text(
                      address.addressTitle!,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                const SizedBox(height: DoubleManager.d_20),

                // Address details
                if (address.street != null)
                  AddressField(
                    title: StringsManager.street,
                    value: address.street!,
                  ),

                if (address.buildingName != null)
                  AddressField(
                    title: StringsManager.buildingName,
                    value: address.buildingName!,
                  ),

                if (address.apartmentNumber != null)
                  AddressField(
                    title: StringsManager.apartmentNumber,
                    value: address.apartmentNumber!,
                  ),

                if (address.floor != null)
                  AddressField(
                    title: StringsManager.floor,
                    value: address.floor!,
                  ),

                if (address.additionalDirections != null)
                  AddressField(
                    title: StringsManager.directions,
                    value: address.additionalDirections!,
                  ),

                const SizedBox(height: DoubleManager.d_10),

                Text(
                  address.googleAddress!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddressField extends StatelessWidget {
  const AddressField({
    super.key,
    required this.title,
    required this.value,
  });

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DoubleManager.d_20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: FontsSize.s13)),
          Text(
            value,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
