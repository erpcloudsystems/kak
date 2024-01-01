import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:kak/core/utils/enums.dart';

import '../../generated/l10n.dart';

class AppLocal {
  static bool? isEnglish;
  static const List<Locale> supportLocals = [Locale('en'), Locale('ar', 'EG')];

  static ValueNotifier<DeviceLanguage> languageNotifier =
      ValueNotifier(DeviceLanguage.arabic);

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  // switch locals
  static Future<void> toggleBetweenLocales(BuildContext context) async {
    if (isEnglish!) {
      AppLocal.languageNotifier.value = DeviceLanguage.english;
    } else {
      AppLocal.languageNotifier.value = DeviceLanguage.arabic;
    }
  }
}
