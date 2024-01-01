import 'package:quickalert/quickalert.dart';
import 'package:flutter/material.dart';

import '../resources/colors_manager.dart';
import '../resources/strings_manager.dart';

abstract class AwesomeDialogUtils {
  static void showConfirmDialog({
    required BuildContext context,
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
    required String confirmMessage,
    String? asset,
  }) =>
      QuickAlert.show(
        context: context,
        type: QuickAlertType.confirm,
        text: confirmMessage,
        confirmBtnText: StringsManager.yes(context),
        cancelBtnText: StringsManager.no(context),
        confirmBtnColor: ColorsManager.gWhite,
        backgroundColor: ColorsManager.gBlack,
        confirmBtnTextStyle: const TextStyle(
          color: ColorsManager.gBlack,
          fontWeight: FontWeight.bold,
        ),
        barrierColor: Colors.transparent,
        titleColor: ColorsManager.gWhite,
        textColor: ColorsManager.gWhite,
        onConfirmBtnTap: onConfirm,
        onCancelBtnTap: onCancel,
        customAsset: asset,
      );
}



    // final successAlert = buildButton(
    //   onTap: () {
    //     QuickAlert.show(
    //       context: context,
    //     type: QuickAlertType.success,
    //       text: 'Transaction Completed Successfully!',
    //       autoCloseDuration: const Duration(seconds: 2),
    //     );
    //   },
    //   title: 'Success',
    //   text: 'Transaction Completed Successfully!',
    //   leadingImage: 'assets/success.gif',
    // );

    // final errorAlert = buildButton(
    //   onTap: () {
    //     QuickAlert.show(
    //       context: context,
    //       type: QuickAlertType.error,
    //       title: 'Oops...',
    //       text: 'Sorry, something went wrong',
    //       backgroundColor: Colors.black,
    //       titleColor: Colors.white,
    //       textColor: Colors.white,
    //     );
    //   },
    //   title: 'Error',
    //   text: 'Sorry, something went wrong',
    //   leadingImage: 'assets/error.gif',
    // );

    // final warningAlert = buildButton(
    //   onTap: () {
    //     QuickAlert.show(
    //       context: context,
    //       type: QuickAlertType.warning,
    //       text: 'You just broke protocol',
    //     );
    //   },
    //   title: 'Warning',
    //   text: 'You just broke protocol',
    //   leadingImage: 'assets/warning.gif',
    // );

    // final infoAlert = buildButton(
    //   onTap: () {
    //     QuickAlert.show(
    //       context: context,
    //       type: QuickAlertType.info,
    //       text: 'Buy two, get one free',
    //     );
    //   },
    //   title: 'Info',
    //   text: 'Buy two, get one free',
    //   leadingImage: 'assets/info.gif',
    // );


    // final customAlert = buildButton(
    //   onTap: () {
    //     var message = '';
    //     QuickAlert.show(
    //       context: context,
    //       type: QuickAlertType.custom,
    //       barrierDismissible: true,
    //       confirmBtnText: 'Save',
    //       customAsset: 'assets/custom.gif',
    //       widget: TextFormField(
    //         decoration: const InputDecoration(
    //           alignLabelWithHint: true,
    //           hintText: 'Enter Phone Number',
    //           prefixIcon: Icon(
    //             Icons.phone_outlined,
    //           ),
    //         ),
    //         textInputAction: TextInputAction.next,
    //         keyboardType: TextInputType.phone,
    //         onChanged: (value) => message = value,
    //       ),
    //       onConfirmBtnTap: () async {
    //         if (message.length < 5) {
    //           await QuickAlert.show(
    //             context: context,
    //             type: QuickAlertType.error,
    //             text: 'Please input something',
    //           );
    //           return;
    //         }
    //         Navigator.pop(context);
    //         await Future.delayed(const Duration(milliseconds: 1000));
    //         await QuickAlert.show(
    //           context: context,
    //           type: QuickAlertType.success,
    //           text: "Phone number '$message' has been saved!.",
    //         );
    //       },
    //     );
    //   },
    //   title: 'Custom',
    //   text: 'Custom Widget Alert',
    //   leadingImage: 'assets/custom.gif',
    // );

   
