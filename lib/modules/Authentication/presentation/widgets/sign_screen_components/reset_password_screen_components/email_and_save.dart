import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../form_components/email_form.dart';
import '../../../../../../core/utils/general_button.dart';
import '../../../bloc/regular_sign/authentication_bloc.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../../core/resources/strings_manager.dart';

class EmailAndSaveButton extends StatelessWidget {
  const EmailAndSaveButton({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    void saveForm() async {
      if (!formKey.currentState!.validate()) return;
      if (formKey.currentState!.validate()) {
        BlocProvider.of<AuthenticationBloc>(context)
            .add(ResetPasswordEvent(email: emailController.text.trim()));
      }
    }

    return Column(
      children: [
        Form(
          key: formKey,
          child: EmailForm(
            emailController: emailController,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: DoubleManager.d_2.h),
          child: ColoredElevatedButton(
            buttonText: StringsManager.sendEmail(context),
            onPressed: saveForm,
          ),
        ),
      ],
    );
  }
}
