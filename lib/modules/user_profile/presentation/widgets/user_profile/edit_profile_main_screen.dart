import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'photo_widget.dart';
import 'user_profile_text_field.dart';
import '../../bloc/user_profile_bloc.dart';
import '../../../domain/entities/user_profile.dart';
import '../../../../../core/utils/general_button.dart';
import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/utils/phone_number_Picker.dart';

class EditUserProfileMainScreen extends StatelessWidget {
  final UserProfileEntity userOldData;
  const EditUserProfileMainScreen({super.key, required this.userOldData});

  @override
  Widget build(BuildContext context) {
    final firstNameController =
        TextEditingController(text: userOldData.firstName);
    final lastNameController =
        TextEditingController(text: userOldData.lastName);
    final formKey = GlobalKey<FormState>();
    String? fileName, photoIn64, phoneNumber;

    void saveFunction() {
      if (formKey.currentState!.validate()) {
        final newUserData = UserProfileEntity(
          mobileNo: phoneNumber ?? userOldData.mobileNo,
          // TODO: REPLACE WITH DROPDOWN FOR ADDRESS.
          address: userOldData.address,
          email: userOldData.address,
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          fileName: fileName,
          image: photoIn64,
        );
        context
            .read<UserProfileBloc>()
            .add(EditUserProfileEvent(user: newUserData));

        // formKey.currentState!.save();
      }
    }

    return Padding(
      padding: const EdgeInsets.all(DoubleManager.d_20),
      child: Form(
        key: formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            //_________________________User Photo______________________
            UserPhotoInEditingScreen(
              fileName: (String newFileName) => fileName = newFileName,
              updatedPhoto64: (String pickedImage) => photoIn64 = pickedImage,
            ),
            const SizedBox(height: DoubleManager.d_20),
            //_________________________First Name______________________
            UserProfileTextField(
              controller: firstNameController,
              fieldName: 'First name',
            ),
            //__________________________Last Name______________________
            UserProfileTextField(
              controller: lastNameController,
              fieldName: 'Last name',
            ),
            //__________________________Phone number______________________
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Phone number',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: ColorsManager.mainColor),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: DoubleManager.d_10),
                  child: PhoneNumberPicker(
                      initialValue: userOldData.mobileNo
                          .replaceFirst(RegExp(r'^(\+20|0)'), ''),
                      phoneNumber: (String number) => phoneNumber = number),
                ),
              ],
            ),

            //_______________________Save Button________________________
            ColoredElevatedButton(
              onPressed: saveFunction,
              buttonText: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
