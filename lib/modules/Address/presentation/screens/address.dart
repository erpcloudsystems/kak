import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:kak/core/utils/general_button.dart';
import 'package:kak/core/utils/snack_bar_util.dart';
import 'package:sizer/sizer.dart';
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: DoubleManager.d_8,
                  vertical: DoubleManager.d_20,
                ),
                child: ColoredElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      SnackBarUtil().getSnackBar(
                        context: context,
                        message: 'Address Saved',
                        color: ColorsManager.gGreen,
                      );
                    }
                  },
                  buttonText: StringsManager.saveAddress,
                ),
              ),
            ],
          ),
        ));
  }
}
