import 'package:flutter/material.dart';

import '../../../../core/resources/fonts_manager.dart';

class UserNameSection extends StatelessWidget {
  const UserNameSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Mohamed Mohamedy',
        style: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(fontSize: FontsSize.s18),
      ),
    );
  }
}
