import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../widgets/create_address/address_form.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../widgets/create_address/save_address_btn.dart';
import '../widgets/create_address/map_snapshot_section.dart';

class CreateAddressScreen extends StatelessWidget {
  const CreateAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mapSnapshot = ModalRoute.of(context)!.settings.arguments as Uint8List;

    final additionalInfController = TextEditingController();
    final apartmentNoController = TextEditingController();
    final buildingController = TextEditingController();
    final streetController = TextEditingController();
    final floorController = TextEditingController();
    final titleController = TextEditingController();
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
                titleController: titleController,
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
                  titleController: titleController,
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
