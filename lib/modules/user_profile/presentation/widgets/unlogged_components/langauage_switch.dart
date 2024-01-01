// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kak/core/resources/routes.dart';

import '../../../../../core/global/global_varibles.dart';
import '../../../../../core/resources/localizations.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../generated/l10n.dart';

class LanguageSwitch extends StatefulWidget {
  const LanguageSwitch({super.key});

  @override
  State<LanguageSwitch> createState() => _LanguageStateSwitch();
}

class _LanguageStateSwitch extends State<LanguageSwitch> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // if (context.locale.languageCode == UnTranslatedStrings.en) {
    //   AppLocal.isEnglish = true;
    // } else {
    //   AppLocal.isEnglish = false;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: ListTile(
            tileColor: Colors.transparent,
            contentPadding: const EdgeInsets.all(DoubleManager.d_0),
            title: const Text(UnTranslatedStrings.english),
            leading: Radio<bool>(
              value: true,
              groupValue: AppLocal.isEnglish,
              onChanged: (bool? value) async {
                AppLocal.isEnglish = value!;
                await AppLocal.toggleBetweenLocales(context);
                setState(() {});
              },
            ),
          ),
        ),
        Flexible(
          child: ListTile(
            tileColor: Colors.transparent,
            title: const Text(UnTranslatedStrings.arabic),
            leading: Radio<bool>(
              value: false,
              groupValue: AppLocal.isEnglish,
              onChanged: (bool? value) async {
                AppLocal.isEnglish = value!;
                await AppLocal.toggleBetweenLocales(context);
                setState(() {});
              },
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              Intl.getCurrentLocale() == 'ar_EG'
                  ? S.load(const Locale('en'))
                  : S.load(const Locale('ar_EG'));
              getDeviceLanguage();
              // Navigator.of(context).pushNamedAndRemoveUntil(
              //     Routes.navigationBarScreenKey, (route) => false);
            },
            icon: const Icon(Icons.abc))
      ],
    );
  }

  // Get the device
  void getDeviceLanguage() {
    final gv = GlobalVariables();
    final currentLocale = Intl.getCurrentLocale();
    debugPrint(currentLocale);
    if (currentLocale == 'ar_EG') {
      gv.setDeviceLanguage = DeviceLanguage.arabic;
    } else {
      gv.setDeviceLanguage = DeviceLanguage.english;
    }
  }
}
