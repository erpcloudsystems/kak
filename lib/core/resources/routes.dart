import 'package:flutter/material.dart';
import '../utils/splash_screen.dart';

import '../utils/error_screen.dart';
import '../utils/custom_navigation_bar.dart';
import '../../modules/Cart/presentation/pages/cart.dart';
import '../../modules/Address/presentation/screens/map.dart';
import '../../modules/meals/presentation/pages/home_page.dart';
import '../../modules/Payment/presentation/screens/checkout.dart';
import '../../modules/meals/presentation/pages/meal_group_items.dart';
import '../../modules/Address/presentation/screens/All_addresses.dart';
import '../../modules/Payment/presentation/screens/order_details.dart';
import '../../modules/meals/presentation/pages/meal_content_page.dart';
import '../../modules/Address/presentation/screens/create_address.dart';
import '../../modules/Payment/presentation/screens/payment_screen.dart';
import '../../modules/Payment/presentation/screens/transaction_screen.dart';
import '../../modules/user_profile/presentation/pages/my_orders_screen.dart';
import '../../modules/authentication/presentation/pages/sign_up_screen.dart';
import '../../modules/authentication/presentation/pages/sign_in_screen.dart';
import '../../modules/user_profile/presentation/pages/edit_profile_screen.dart';
import '../../modules/authentication/presentation/pages/password_reset_screen.dart';

class Routes {
  static const String mealGroupItemsScreenKey = '/Meal-Group-Item';
  static const String passwordResetScreenKey = '/password_reset';
  static const String navigationBarScreenKey = '/navigation-bar';
  static const String allAddressesScreenKey = '/all-addresses';
  static const String orderDetailsScreenKey = '/order-details';
  static const String mealContentsScreenKey = '/meal-contents';
  static const String editProfileScreenKey = '/edit-profile';
  static const String transactionScreenKey = '/transaction';
  static const String myOrdersScreenKey = '/my-orders';
  static const String checkoutScreenKey = '/checkout';
  static const String addressScreenKey = '/address';
  static const String paymentScreenKey = '/payment';
  static const String signInScreenKey = '/sign-in';
  static const String signUpScreenKey = '/sign-up';
  static const String splashScreenKey = '/splash';
  static const String errorScreenKey = '/error';
  static const String cartScreenKey = '/cart';
  static const String homeScreenKey = '/home';
  static const String mapScreenKey = '/map';

  static Map<String, WidgetBuilder> get routes {
    return {
      mealGroupItemsScreenKey: (_) => const MealGroupItemsScreen(),
      navigationBarScreenKey: (_) => const CustomNavigationBar(),
      passwordResetScreenKey: (_) => const PasswordResetScreen(),
      mealContentsScreenKey: (_) => const MealsContentsScreen(),
      allAddressesScreenKey: (_) => const AllAddressesScreen(),
      orderDetailsScreenKey: (_) => const OrderDetailsScreen(),
      transactionScreenKey: (_) => const TransactionScreen(),
      editProfileScreenKey: (_) => const EditProfileScreen(),
      addressScreenKey: (_) => const CreateAddressScreen(),
      checkoutScreenKey: (_) => const CheckoutScreen(),
      paymentScreenKey: (_) => const PaymentScreen(),
      myOrdersScreenKey: (_) => const MyOrdersScreen(),
      splashScreenKey: (_) => const SplashScreen(),
      signUpScreenKey: (_) => const SignUpScreen(),
      signInScreenKey: (_) => const SignInScreen(),
      errorScreenKey: (_) => const ErrorScreen(),
      cartScreenKey: (_) => const CartScreen(),
      homeScreenKey: (_) => const HomePage(),
      mapScreenKey: (_) => const MapScreen(),
    };
  }
}
