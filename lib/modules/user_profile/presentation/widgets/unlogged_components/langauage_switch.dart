import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../../core/global/global_varibles.dart';
import '../../../../../core/resources/localizations.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../authentication/presentation/bloc/caching_user_data/caching_user_data_bloc.dart';

class LanguageSwitch extends StatefulWidget {
  const LanguageSwitch({super.key});

  @override
  State<LanguageSwitch> createState() => _LanguageStateSwitch();
}

class _LanguageStateSwitch extends State<LanguageSwitch> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (Intl.getCurrentLocale() == UnTranslatedStrings.en) {
      AppLocal.isEnglish = true;
    } else {
      AppLocal.isEnglish = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final gv = GlobalVariables();
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
                gv.setDeviceLanguage = DeviceLanguage.english;
                context.read<CachingUserDataBloc>().add(
                    ChangeAppLanguageEvent(language: DeviceLanguage.english));
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
                gv.setDeviceLanguage = DeviceLanguage.arabic;
                context.read<CachingUserDataBloc>().add(
                    ChangeAppLanguageEvent(language: DeviceLanguage.arabic));
                setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }
}
