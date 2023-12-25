import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/localizations.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/strings_manager.dart';

class LanguageSwitch extends StatefulWidget {
  const LanguageSwitch({super.key});

  @override
  State<LanguageSwitch> createState() => _LanguageStateSwitch();
}

class _LanguageStateSwitch extends State<LanguageSwitch> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (context.locale.languageCode == UnTranslatedStrings.en) {
      AppLocal.isEnglish = true;
    } else {
      AppLocal.isEnglish = false;
    }
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
              onChanged: (bool? value) {
                AppLocal.isEnglish = value!;
                AppLocal.toggleBetweenLocales(context);
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
              onChanged: (bool? value) {
                AppLocal.isEnglish = value!;
                AppLocal.toggleBetweenLocales(context);
                setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }
}