import 'package:flutter/material.dart';

import '../logged_components/options_list.dart';

// TODO: Implement url launcher logic
class ContactUsOption extends StatelessWidget {
  const ContactUsOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileListElement(
      icon: Icons.facebook,
      text: 'Contact us',
      onTap: (context) {},
    );
  }
}
