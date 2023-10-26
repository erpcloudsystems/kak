import 'package:flutter/material.dart';
import 'package:kak/core/resources/strings_manager.dart';

import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/values_manager.dart';

class OptionsList extends StatelessWidget {
  const OptionsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) => profileList[index],
      separatorBuilder: (context, index) => Divider(
        endIndent: DoubleManager.d_27,
        indent: DoubleManager.d_77,
        color: Colors.grey.shade400,
      ),
      itemCount: profileList.length,
    );
  }
}

class ProfileListElement extends StatelessWidget {
  const ProfileListElement({
    required this.icon,
    required this.text,
    super.key,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
      onTap: () {},
    );
  }
}

const List<ProfileListElement> profileList = [
  ProfileListElement(
    icon: Icons.person_2_outlined,
    text: StringsManager.myAccount,
  ),
  ProfileListElement(
    icon: Icons.shopping_bag_outlined,
    text: StringsManager.myOrders,
  ),
  ProfileListElement(
    icon: Icons.home_outlined,
    text: StringsManager.myAddress,
  ),
  ProfileListElement(
    icon: Icons.payment_outlined,
    text: StringsManager.paymentMethod,
  ),
  ProfileListElement(
    icon: Icons.logout,
    text: StringsManager.logout,
  ),
];
