import '../global/global_varibles.dart';
import '../utils/enums.dart';

abstract class ApiConstance {
  // System endpoints_______________________________________________________
  static const String baseUrl = 'https://kak.erpcloud.systems/api/method';
  static const String kakUrl = 'https://kak.erpcloud.systems';

  // Authentication
  static const String resetPasswordEndPoint = '/kak.api.resetPassword';
  static const String deleteUserEndPoint = '/kak.api.delete_user';
  static const String signUpEndPoint = '/kak.api.sign_up';
  static const String logoutEndPoint = '/kak.api.logout';
  static const String loginEndPoint = '/kak.api.login';

  // Address
  static const String sendUserAddress = '/kak.add.add_address';

  // Meals
  static String get getOffersEndPoint => getEndPointAccordingToDeviceLng(
        ar: '/kak.general.get_offered_meals_arabic',
        en: '/kak.general.get_offered_meals_english',
      );

  static String get getFeaturedEndPoint => getEndPointAccordingToDeviceLng(
        ar: '/kak.general.get_featured_meals_arabic',
        en: '/kak.general.get_featured_meals_english',
      );

  static String get getMealsGroupsEndPoint => getEndPointAccordingToDeviceLng(
        ar: '/kak.general.get_group_arabic',
        en: '/kak.general.get_group_english',
      );

  static String get getMealsGroupsItemsEndPoint =>
      getEndPointAccordingToDeviceLng(
        en: '/kak.general.get_items_english',
        ar: '/kak.general.get_items_arabic',
      );

  static String get getMealDetailsEndPoint => getEndPointAccordingToDeviceLng(
        en: '/kak.general.get_meals_details_english',
        ar: '/kak.general.get_meals_details_arabic',
      );

  // Orders
  static const String createOrderEndPoint = '/kak.add.sales_order';

  // Paymob endpoints_______________________________________________________
  static const String paymobBaseUrl = 'https://accept.paymob.com/api';

  static const String paymobPaymentKeyRequest = '/acceptance/payment_keys';
  static const String paymobOrderRegistration = '/ecommerce/orders';
  static const String paymobAuthRequest = '/auth/tokens';
}

// Helper functions_______________________________________________________
String getEndPointAccordingToDeviceLng({required String ar, en}) {
  final gv = GlobalVariables().getDeviceLanguage;
  String endPoint;
  gv == DeviceLanguage.arabic ? endPoint = ar : endPoint = en;
  return endPoint;
}
