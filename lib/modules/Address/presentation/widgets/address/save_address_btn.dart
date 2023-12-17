import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../bloc/address/address_bloc.dart';
import '../../../../../core/utils/enums.dart';
import '../../../domain/entities/address.dart';
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
    required this.isPrimaryValue,
    required this.mapSnapshot,
    required this.formKey,
  });

  final TextEditingController additionalInfController;
  final TextEditingController apartmentNoController;
  final TextEditingController buildingController;
  final TextEditingController streetController;
  final TextEditingController floorController;
  final GlobalKey<FormState> formKey;
  final Uint8List mapSnapshot;
  final bool isPrimaryValue;

  @override
  Widget build(BuildContext context) {
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
                StringsManager.savingAddress,
              );
              break;
            case RequestState.success:
              Navigator.of(context).pushNamedAndRemoveUntil(
                arguments: mapSnapshot,
                Routes.checkoutScreenKey,
                (route) => route.settings.name == Routes.navigationBarScreenKey,
              );
              SnackBarUtil().getSnackBar(
                context: context,
                color: ColorsManager.gGreen,
                message: StringsManager.newAddressMessage,
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
              context.read<AddressBloc>().add(SendUserAddressEvent(
                      address: AddressEntity(
                    googleAddress:
                        context.read<LocationBloc>().state.getAddressMessage,
                    apartmentNumber: apartmentNoController.text.trim(),
                    buildingName: buildingController.text.trim(),
                    isPrimary: isPrimaryValue,
                    street: streetController.text.trim(),
                    additionalDirections:
                        additionalInfController.text.trim().isEmpty
                            ? null
                            : additionalInfController.text.trim(),
                    floor: floorController.text.trim().isEmpty
                        ? null
                        : floorController.text.trim(),
                  )));
            }
          },
          buttonText: StringsManager.saveAddress,
        ),
      ),
    );
  }
}
