import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kak/core/utils/enums.dart';
import 'package:kak/core/utils/general_button.dart';
import 'package:kak/core/utils/snack_bar_util.dart';
import 'package:kak/modules/Address/domain/entities/address.dart';
import 'package:kak/modules/Address/presentation/bloc/address/address_bloc.dart';
import 'package:sizer/sizer.dart';
import '../bloc/location/location_bloc.dart';
import '../widgets/address/form_field.dart';
import '../widgets/address/map_snapshot_section.dart';
import 'package:kak/core/resources/colors_manager.dart';
import 'package:kak/core/resources/values_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mapSnapshot = ModalRoute.of(context)!.settings.arguments as Uint8List;

    final additionalInfController = TextEditingController();
    final apartmentNoController = TextEditingController();
    final buildingController = TextEditingController();
    final streetController = TextEditingController();
    final floorController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
        backgroundColor: ColorsManager.gWhite,
        appBar: AppBar(title: const Text(StringsManager.newAddress)),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              // Map snapshot
              MapSnapshotSection(mapSnapshot: mapSnapshot),
              Padding(
                padding: const EdgeInsets.only(
                  top: DoubleManager.d_60,
                  left: DoubleManager.d_8,
                  right: DoubleManager.d_8,
                ),
                child: SizedBox(
                  height: DoubleManager.d_45.h,
                  child: Form(
                    key: formKey,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      children: [
                        // Building name
                        AddressFormField(
                          controller: buildingController,
                          hint: StringsManager.buildingName,
                        ),
                        // Apt & Floor
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // Apartment number
                            Expanded(
                              child: AddressFormField(
                                controller: apartmentNoController,
                                hint: StringsManager.apartmentNumber,
                              ),
                            ),

                            const SizedBox(width: DoubleManager.d_15),
                            // Floor
                            Expanded(
                              child: AddressFormField(
                                controller: floorController,
                                hint: StringsManager.floor,
                                optional: true,
                              ),
                            ),
                          ],
                        ),
                        // Street
                        AddressFormField(
                          controller: streetController,
                          hint: StringsManager.street,
                        ),
                        // Additional info
                        AddressFormField(
                          controller: additionalInfController,
                          hint: StringsManager.additionalDir,
                          optional: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Save button
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: DoubleManager.d_8,
                  vertical: DoubleManager.d_20,
                ),
                child: BlocListener<AddressBloc, AddressState>(
                  listenWhen: (previous, current) =>
                      previous.sendUserAddressState !=
                      current.sendUserAddressState,
                  listener: (context, state) {
                    switch (state.sendUserAddressState) {
                      case RequestState.success:
                        SnackBarUtil().getSnackBar(
                          context: context,
                          message: 'Address Saved',
                          color: ColorsManager.gGreen,
                        );
                        break;
                      case RequestState.error:
                        SnackBarUtil().getSnackBar(
                          context: context,
                          message: state.sendUserAddressMessage,
                          color: ColorsManager.gRed,
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
                              googleAddress: context
                                  .read<LocationBloc>()
                                  .state
                                  .getAddressMessage,
                              apartmentNumber:
                                  apartmentNoController.text.trim(),
                              buildingName: buildingController.text.trim(),
                              isPrimary: false,
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
              ),
            ],
          ),
        ));
  }
}
