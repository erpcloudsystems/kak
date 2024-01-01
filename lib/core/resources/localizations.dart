import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class AppLocal {
  static bool? isEnglish;
  static const List<Locale> supportLocals = [Locale('en'), Locale('ar', 'EG')];
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  // switch locals
  static Future<void> toggleBetweenLocales(BuildContext context) async {
    // if (isEnglish!) {
    //   await context.setLocale(supportLocals[0]);
    // } else {
    //   await context.setLocale(supportLocals[1]);
    // }
  }

  // reset device local
  static Locale? fallbackLocal(
    Locale? currentLocal,
    Iterable<Locale> supportLocal,
  ) {
    if (currentLocal != null) {
      for (final Locale locale in supportLocal) {
        if (locale.languageCode == currentLocal.languageCode) {
          return currentLocal;
        }
      }
    }
    return null;
  }
}
