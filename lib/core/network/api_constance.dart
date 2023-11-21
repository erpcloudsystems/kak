abstract class ApiConstance {
  // System endpoints_______________________________________________________
  static const String baseUrl = 'https://kak.erpcloud.systems/api/method';

  static const String resetPasswordEndPoint = '/kak.api.resetPassword';
  static const String deleteUserEndPoint = '/kak.api.delete_user';
  static const String signUpEndPoint = '/kak.api.register';
  static const String loginEndPoint = '/kak.api.login';

  // Paymob endpoints_______________________________________________________
  static const String paymobBaseUrl = 'https://accept.paymob.com/api';
  
  static const String paymobPaymentKeyRequest = '/acceptance/payment_keys';
  static const String paymobOrderRegistration = '/ecommerce/orders';
  static const String paymobAuthRequest = '/auth/tokens';
}
