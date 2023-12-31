import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'form_field.dart';
import 'is_primary_switch.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/strings_manager.dart';

class AddressForm extends StatelessWidget {
  const AddressForm({
    super.key,
    required this.additionalInfController,
    required this.apartmentNoController,
    required this.buildingController,
    required this.streetController,
    required this.floorController,
    required this.titleController,
    required this.switchValue,
    required this.formKey,
  });

  final TextEditingController additionalInfController;
  final TextEditingController apartmentNoController;
  final TextEditingController buildingController;
  final TextEditingController streetController;
  final TextEditingController floorController;
  final TextEditingController titleController;
  final ValueNotifier<bool> switchValue;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              // Building name
              AddressFormField(
                controller: buildingController,
                hint: StringsManager.buildingName(context),
              ),

              // Apt & Floor
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Apartment number
                  Expanded(
                    child: AddressFormField(
                      controller: apartmentNoController,
                      hint: StringsManager.apartmentNumber(context),
                    ),
                  ),
                  const SizedBox(width: DoubleManager.d_15),

                  // Floor
                  Expanded(
                    child: AddressFormField(
                      controller: floorController,
                      hint: StringsManager.floor(context),
                      optional: true,
                    ),
                  ),
                ],
              ),

              // Street
              AddressFormField(
                controller: streetController,
                hint: StringsManager.street(context),
              ),

              // Title
              AddressFormField(
                controller: titleController,
                hint: StringsManager.title(context),
              ),

              // Additional info
              AddressFormField(
                controller: additionalInfController,
                hint: StringsManager.additionalDir(context),
                optional: true,
              ),

              // Is default address
              IsPrimarySwitch(
                toggleSwitch: (value) => switchValue.value = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
