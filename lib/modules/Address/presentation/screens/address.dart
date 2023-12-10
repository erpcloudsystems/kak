import 'dart:typed_data';

import 'package:flutter/material.dart';
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

    final buildingController = TextEditingController();

    return Scaffold(
        backgroundColor: ColorsManager.gWhite,
        appBar: AppBar(title: const Text(StringsManager.newAddress)),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              MapSnapshotSection(mapSnapshot: mapSnapshot),
              Padding(
                padding: const EdgeInsets.only(
                  top: DoubleManager.d_60,
                  left: DoubleManager.d_8,
                  right: DoubleManager.d_8,
                ),
                child: Form(
                    child: Column(children: [
                  AddressFormField(
                    controller: buildingController,
                    hint: StringsManager.buildingName,
                  ),
                ])),
              )
            ],
          ),
        ));
  }
}
