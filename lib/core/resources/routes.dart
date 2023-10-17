import 'package:flutter/material.dart';

import '../../main.dart';
import '../utils/error_screen.dart';
import '../../modules/authentication/presentation/pages/password_reset_screen.dart';
import '../../modules/authentication/presentation/pages/sign_in_screen.dart';
import '../../modules/authentication/presentation/pages/sign_up_screen.dart';

class Routes {
    static const String passwordResetScreenKey = '/password_reset';
  static const String signUpScreenKey = '/sign-up';
  static const String signInScreenKey = '/sign-in';
  static const String errorScreenKey = '/error';
  static const String homeScreenKey = '/home';

  static Map<String, WidgetBuilder> get routes {
    return {
      passwordResetScreenKey: (context) => const PasswordResetScreen(),
      homeScreenKey: (_) => const MyHomePage(title: 'Kak'),
      signUpScreenKey: (_) => const SignUpScreen(),
      signInScreenKey: (_) => const SignInScreen(),
      errorScreenKey: (_) => const ErrorScreen(),
    };
  }
}
