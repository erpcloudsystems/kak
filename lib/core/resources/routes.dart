import 'package:flutter/material.dart';

import '../utils/error_screen.dart';
import '../utils/custom_navigation_bar.dart';
import '../../modules/meals/presentation/pages/home_page.dart';
import '../../modules/meals/presentation/pages/meal_content_page.dart';
import '../../modules/Address/presentation/screens/address_screen.dart';
import '../../modules/Payment/presentation/screens/payment_screen.dart';
import '../../modules/user_profile/presentation/pages/my_orders_screen.dart';
import '../../modules/authentication/presentation/pages/sign_up_screen.dart';
import '../../modules/authentication/presentation/pages/sign_in_screen.dart';
import '../../modules/authentication/presentation/pages/password_reset_screen.dart';

class Routes {
  static const String passwordResetScreenKey = '/password_reset';
  static const String navigationBarScreenKey = '/navigation-bar';
  static const String mealContentsScreenKey = '/meal-contents';
  static const String myOrdersScreenKey = '/my-orders';
  static const String addressScreenKey = '/address';
  static const String paymentScreenKey = '/payment';
  static const String signUpScreenKey = '/sign-up';
  static const String signInScreenKey = '/sign-in';
  static const String errorScreenKey = '/error';
  static const String homeScreenKey = '/home';

  static Map<String, WidgetBuilder> get routes {
    return {
      passwordResetScreenKey: (_) => const PasswordResetScreen(),
      navigationBarScreenKey: (_) => const CustomNavigationBar(),
      mealContentsScreenKey: (_) => const MealsContentsScreen(),
      myOrdersScreenKey:(_) => const MyOrdersScreen(), 
      paymentScreenKey: (_) => const PaymentScreen(),
      addressScreenKey: (_) => const AddressScreen(),
      signUpScreenKey: (_) => const SignUpScreen(),
      signInScreenKey: (_) => const SignInScreen(),
      errorScreenKey: (_) => const ErrorScreen(),
      homeScreenKey: (_) => const HomePage(),
    };
  }
}
