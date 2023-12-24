import 'package:flutter/material.dart';

import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/values_manager.dart';

class OptionsList extends StatelessWidget {
  const OptionsList({super.key, required this.options});
  final List options;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => options[index],
      separatorBuilder: (context, index) => Divider(
        endIndent: DoubleManager.d_27,
        indent: DoubleManager.d_77,
        color: Colors.grey.shade400,
      ),
      itemCount: options.length,
    );
  }
}

class ProfileListElement extends StatelessWidget {
  const ProfileListElement({
    required this.onTap,
    required this.icon,
    required this.text,
    super.key,
  });

  final IconData icon;
  final String text;
  final void Function(BuildContext context) onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.transparent,
      leading: Icon(icon, size: DoubleManager.d_30),
      title: Padding(
        padding: const EdgeInsets.only(left: DoubleManager.d_8),
        child: Text(text),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      titleTextStyle: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontSize: FontsSize.s15),
      onTap: () => onTap(context),
    );
  }
}