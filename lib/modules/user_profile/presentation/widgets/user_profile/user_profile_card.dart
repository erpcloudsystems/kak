import 'package:flutter/material.dart';

import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/values_manager.dart';

class UserProfileCard extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  const UserProfileCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsManager.scaffoldColor,
      margin: const EdgeInsets.all(DoubleManager.d_15),
      elevation: DoubleManager.d_10,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(DoubleManager.d_30))),
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        minLeadingWidth: DoubleManager.d_40,
        leading: Padding(
          padding: const EdgeInsets.only(top: DoubleManager.d_8),
          child: Icon(icon),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Color.fromARGB(255, 99, 96, 96),
            fontSize: DoubleManager.d_15,
          ),
        ),
        subtitle: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            subtitle,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
