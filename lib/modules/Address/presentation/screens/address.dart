import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../widgets/address/address_form.dart';
import '../widgets/address/save_address_btn.dart';
import '../widgets/address/map_snapshot_section.dart';
import '../../../../core/resources/colors_manager.dart';
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

    final ValueNotifier<bool> switchValue = ValueNotifier<bool>(false);

    return Scaffold(
        backgroundColor: ColorsManager.gWhite,
        appBar: AppBar(title: const Text(StringsManager.newAddress)),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              // Map snapshot
              MapSnapshotSection(mapSnapshot: mapSnapshot),

              // Form
              AddressForm(
                additionalInfController: additionalInfController,
                apartmentNoController: apartmentNoController,
                buildingController: buildingController,
                streetController: streetController,
                floorController: floorController,
                switchValue: switchValue,
                formKey: formKey,
              ),

              // Save button
              ValueListenableBuilder(
                valueListenable: switchValue,
                builder: (context, value, child) => SaveAddressBtn(
                  additionalInfController: additionalInfController,
                  apartmentNoController: apartmentNoController,
                  buildingController: buildingController,
                  streetController: streetController,
                  floorController: floorController,
                  mapSnapshot: mapSnapshot,
                  isPrimaryValue: value,
                  formKey: formKey,
                ),
              ),
            ],
          ),
        ));
  }
}
