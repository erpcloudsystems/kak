import 'package:flutter/material.dart';

import '../utils/enums.dart';
import '../global/constant_keys.dart';
import '../global/global_varibles.dart';
import '../../modules/Address/presentation/screens/map.dart';

abstract class ApiConstance {
  // System endpoints_______________________________________________________
  static const String baseUrl = 'https://kak.erpcloud.systems/api/method';
  static const String kakUrl = 'https://kak.erpcloud.systems';

  // Authentication
  static const String resetPasswordEndPoint = '/kak.api.resetPassword';
  static const String deleteUserEndPoint = '/kak.api.delete_user';
  static const String signUpEndPoint = '/kak.api.sign_up';
  static const String loginEndPoint = '/kak.api.login';
  static const String logoutEndPoint = '/logout';

  // User profile 
  static const String getUserProfileEndPoint = '/kak.general.user_info';
  static const String editUserProfileEndPoint = '/kak.general.update_user_profile';


  // Orders
  static const String getOrderDetailsEndPoint =
      '/kak.general.get_sales_order_details';
  static const String getOrdersListEndPoint = '/kak.general.get_sales_order';
  static const String createOrderEndPoint = '/kak.add.sales_order';
  static const String getTaxesEndPoint = '/kak.general.get_taxes';

  // Address
  static const String getAllAddressesEndpoint =
      '/kak.general.get_user_addresses';
  static const String deleteAddress = '/kak.add.delete_address';
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

  // Paymob endpoints_______________________________________________________
  static const String paymobBaseUrl = 'https://accept.paymob.com/api';

  static const String paymobPaymentKeyRequest = '/acceptance/payment_keys';
  static const String paymobOrderRegistration = '/ecommerce/orders';
  static const String paymobAuthRequest = '/auth/tokens';

  // Google endpoints_______________________________________________________
  static const String googleMapsBaseUrl =
      'https://maps.googleapis.com/maps/api';
  static const String googleMapsGeocodeApi = '/geocode/json';
  static String getMapSnapshot(BuildContext context, String lat, long) =>
      'https://maps.googleapis.com/maps/api/staticmap?zoom=$cameraZoom&size=400x300&markers=$lat,$long&key=${ConstantKeys.getMapsApiKey(context)}';
}

// Helper functions__________________________________________________________
String getEndPointAccordingToDeviceLng({required String ar, en}) {
  final gv = GlobalVariables().getDeviceLanguage;
  String endPoint;
  gv == DeviceLanguage.arabic ? endPoint = ar : endPoint = en;
  return endPoint;
}
