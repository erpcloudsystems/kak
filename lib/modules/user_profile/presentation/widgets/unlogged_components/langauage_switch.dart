import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../../core/global/global_varibles.dart';
import '../../../../../core/resources/localizations.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../meals/presentation/bloc/meals_bloc.dart';
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
                AppLocal.toggleBetweenLocales(context);
                _changeGlobalLanguage(DeviceLanguage.english);
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
                AppLocal.toggleBetweenLocales(context);
                _changeGlobalLanguage(DeviceLanguage.arabic);
                setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }

  /// this method cache the new choosed language, and change the call of the endpoint to
  /// the new language, and add new events with the new language.
  void _changeGlobalLanguage(DeviceLanguage language) {
    final gv = GlobalVariables();
    gv.setDeviceLanguage = language;
    context
        .read<CachingUserDataBloc>()
        .add(ChangeAppLanguageEvent(language: language));
    context.read<MealsBloc>().add(GetOffersEvent());
    context.read<MealsBloc>().add(GetFeaturedEvent());
    context.read<MealsBloc>().add(GetMealsGroupsEvent());
  }
}
