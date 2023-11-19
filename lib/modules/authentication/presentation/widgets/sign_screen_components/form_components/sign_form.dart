import 'package:kak/core/resources/strings_manager.dart';
import 'package:kak/core/utils/custom_text_field.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'email_form.dart';
import 'password_form.dart';
import 'remember_me_row.dart';
// import '../../../../../../core/global/type_def.dart';
import '../../../../../../core/utils/general_button.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../../core/utils/phone_number_Picker.dart';
// import '../../../bloc/regular_sign/authentication_bloc.dart';

class SignForm extends StatelessWidget {
  // final AuthenticationEventFunction signEvent;
  const SignForm({
    super.key,
    // required this.signEvent,
    required this.buttonText,
    required this.isSignUp,
  });

  final String buttonText;
  final bool isSignUp;
  @override
  Widget build(BuildContext context) {
    String phoneNumber;
    final passwordController = TextEditingController();
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    void saveForm() {
      if (formKey.currentState!.validate()) {
        // BlocProvider.of<AuthenticationBloc>(context).add(signEvent(
        //     emailController.text.trim(), passwordController.text.trim()));
      }
    }

    return Form(
      key: formKey,
      child: Column(
        children: [
          EmailForm(emailController: emailController),
          SizedBox(height: DoubleManager.d_2.h),
          PasswordForm(passwordController: passwordController),
          SizedBox(height: DoubleManager.d_2.h),
          if (isSignUp)
            Column(
              children: [
                CustomTextField(
                    controller: firstNameController,
                    icon: Icons.person,
                    hint: StringsManager.firstName),
                SizedBox(height: DoubleManager.d_2.h),
                CustomTextField(
                    controller: lastNameController,
                    icon: Icons.person,
                    hint: StringsManager.lastName),
                SizedBox(height: DoubleManager.d_2.h),
                PhoneNumberPicker(
                    phoneNumber: (String number) => phoneNumber = number),
              ],
            ),
          RememberMeRow(emailController: emailController),
          ColoredElevatedButton(buttonText: buttonText, onPressed: saveForm),
        ],
      ),
    );
  }
}
