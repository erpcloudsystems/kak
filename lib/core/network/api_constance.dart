abstract class ApiConstance {
  static const String baseUrl = '';

  static const String resetPasswordEndPoint = '';
  static const String signUpEndPoint = '';
  static const String logoutEndPoint = '';
  static const String loginEndPoint = '';

  // Paymob endpoints:
  static const String paymobPaymentKeyRequest = '/acceptance/payment_keys';
  static const String paymobBaseUrl = 'https://accept.paymob.com/api';
  static const String paymobOrderRegistration = '/ecommerce/orders';
  static const String paymobAuthRequest = '/auth/tokens';
}
