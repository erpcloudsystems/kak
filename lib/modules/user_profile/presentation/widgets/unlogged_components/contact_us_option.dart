import 'package:flutter/material.dart';

import '../logged_components/options_list.dart';
import '../../../../../core/utils/url_launcher.dart';
import '../../../../../core/resources/strings_manager.dart';

class ContactUsOption extends StatelessWidget {
  const ContactUsOption({super.key});

  @override
  Widget build(BuildContext context) {
    const String mumoFacebookPage =
        'https://www.facebook.com/profile.php?id=61552647353722';

    return ProfileListElement(
      icon: Icons.facebook,
      text: StringsManager.contactUs(context),
      onTap: (context) async =>
          await UrlLauncherHelper.urlLauncherMethod(context, mumoFacebookPage),
    );
  }
}
