import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/address.dart';
import '../../bloc/address/address_bloc.dart';
import '../../../../../core/utils/enums.dart';
import '../../bloc/location/location_bloc.dart';
import '../../../../../core/resources/routes.dart';
import '../../../../../core/utils/general_button.dart';
import '../../../../../core/utils/snack_bar_util.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/utils/loading_indicator_util.dart';

class SaveAddressBtn extends StatelessWidget {
  const SaveAddressBtn({
    super.key,
    required this.additionalInfController,
    required this.apartmentNoController,
    required this.buildingController,
    required this.streetController,
    required this.floorController,
    required this.titleController,
    required this.isPrimaryValue,
    required this.formKey,
  });

  final TextEditingController additionalInfController;
  final TextEditingController apartmentNoController;
  final TextEditingController buildingController;
  final TextEditingController streetController;
  final TextEditingController floorController;
  final TextEditingController titleController;
  final GlobalKey<FormState> formKey;
  final bool isPrimaryValue;

  @override
  Widget build(BuildContext context) {
    AddressEntity? address;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: DoubleManager.d_8,
        vertical: DoubleManager.d_20,
      ),
      child: BlocListener<AddressBloc, AddressState>(
        listenWhen: (previous, current) =>
            previous.sendUserAddressState != current.sendUserAddressState,
        listener: (context, state) {
          switch (state.sendUserAddressState) {
            case RequestState.loading:
              LoadingUtils.showLoadingDialog(
                context,
                LoadingType.linear,
                StringsManager.savingAddress(context),
              );
              break;
            case RequestState.success:
              Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.checkoutScreenKey,
                (route) => route.settings.name == Routes.navigationBarScreenKey,
                arguments: address,
              );
              SnackBarUtil().getSnackBar(
                context: context,
                color: ColorsManager.gGreen,
                message: StringsManager.newAddressMessage(context),
              );
              break;
            case RequestState.error:
              Navigator.of(context).pop();
              SnackBarUtil().getSnackBar(
                context: context,
                color: ColorsManager.gRed,
                message: state.sendUserAddressMessage,
              );
              break;
            default:
          }
        },
        child: ColoredElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              final googleAddressData =
                  context.read<LocationBloc>().state.googleAddress;
              address = AddressEntity(
                googleAddress: googleAddressData.fullAddress,
                longitude: googleAddressData.longitude,
                latitude: googleAddressData.latitude,
                country: googleAddressData.country,
                city: googleAddressData.city,
                apartmentNumber: apartmentNoController.text.trim(),
                buildingName: buildingController.text.trim(),
                addressTitle: titleController.text.trim(),
                street: streetController.text.trim(),
                isDefaultAddress: isPrimaryValue,
                additionalDirections:
                    additionalInfController.text.trim().isEmpty
                        ? null
                        : additionalInfController.text.trim(),
                floor: floorController.text.trim().isEmpty
                    ? null
                    : floorController.text.trim(),
              );
              context
                  .read<AddressBloc>()
                  .add(SendUserAddressEvent(address: address!));
            }
          },
          buttonText: StringsManager.saveAddress(context),
        ),
      ),
    );
  }
}
