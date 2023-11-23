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

  // Meals
  static const String getOffersEnglishEndPoint = '/kak.general.get_offered_meals_english';
  static const String getOffersArabicEndPoint = '/kak.general.get_offered_meals_arabic';

  // Paymob endpoints_______________________________________________________
  static const String paymobBaseUrl = 'https://accept.paymob.com/api';
  
  static const String paymobPaymentKeyRequest = '/acceptance/payment_keys';
  static const String paymobOrderRegistration = '/ecommerce/orders';
  static const String paymobAuthRequest = '/auth/tokens';
}
