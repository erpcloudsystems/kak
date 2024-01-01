import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/fonts_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../authentication/presentation/bloc/regular_sign/authentication_bloc.dart';

class UserNameSection extends StatelessWidget {
  const UserNameSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        buildWhen: (previous, current) =>
            previous.isUserLoggedIn != current.isUserLoggedIn,
        builder: (context, state) {
          String userName;
          switch (state.isUserLoggedIn) {
            case true:
              userName = state.loggedInUser.name!;
              break;

            case false:
              userName = StringsManager.guest(context);
              break;
          }
          return Text(
            userName,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontSize: FontsSize.s18),
          );
        },
      ),
    );
  }
}
