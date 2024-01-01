import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/routes.dart';
import '../widgets/logged_components/options_list.dart';
import '../widgets/logged_components/photo_widget.dart';
import '../widgets/logged_components/logout_button.dart';
import '../../../../core/resources/strings_manager.dart';
import '../widgets/unlogged_components/version_section.dart';
import '../widgets/logged_components/user_name_section.dart';
import '../widgets/unlogged_components/langauage_switch.dart';
import '../widgets/unlogged_components/contact_us_option.dart';
import '../widgets/logged_components/delete_account_button.dart';
import '../../../../core/utils/custom_scrolling_animated_template.dart';
import '../../../authentication/presentation/bloc/regular_sign/authentication_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(StringsManager.profile(context))),
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        buildWhen: (previous, current) =>
            previous.isUserLoggedIn != current.isUserLoggedIn,
        builder: (context, state) {
          return CustomScrollingAnimatedTemplate(
            children: [
              const UserPhotoWidget(),
              const UserNameSection(),
              state.isUserLoggedIn
                  ? OptionsList(options: loggedOptionsList(context))
                  : OptionsList(options: guestOptionsList(context)),
              const LanguageSwitch(),
              const VersionSection(),
            ],
          );
        },
      ),
    );
  }
}

/// We use this list if there is an user logged in.
List loggedOptionsList(BuildContext context) => [
      ProfileListElement(
        icon: Icons.person_2_outlined,
        text: StringsManager.myAccount(context),
        onTap: (context) =>
            Navigator.of(context).pushNamed(Routes.editProfileScreenKey),
      ),
      ProfileListElement(
          icon: Icons.shopping_bag_outlined,
          text: StringsManager.myOrders(context),
          onTap: (context) =>
              Navigator.of(context).pushNamed(Routes.myOrdersScreenKey)),
      ProfileListElement(
        icon: Icons.payment_outlined,
        text: StringsManager.paymentMethod(context),
        onTap: (context) =>
            Navigator.of(context).pushNamed(Routes.paymentScreenKey),
      ),
      const LogoutButton(),
      const DeleteAccountButton(),
      const ContactUsOption(),
    ];

// We use this list in the guest and no user logged in case.
List guestOptionsList(BuildContext context) => [
      ProfileListElement(
        icon: Icons.login_rounded,
        text: StringsManager.login(context),
        onTap: (context) =>
            Navigator.of(context).pushNamed(Routes.signInScreenKey),
      ),
      ProfileListElement(
        icon: Icons.app_registration_rounded,
        text: StringsManager.register(context),
        onTap: (context) =>
            Navigator.of(context).pushNamed(Routes.signUpScreenKey),
      ),
      const ContactUsOption(),
    ];
