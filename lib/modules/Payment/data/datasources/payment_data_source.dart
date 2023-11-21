import 'package:dio/dio.dart';

import '../../../../core/global/constant_keys.dart';
import '../../../../core/network/dio_helper.dart';
import '../../../../core/network/api_constance.dart';
import '../../domain/entities/card_payment_entity.dart';

abstract class PaymentBaseDataSource {
  Future<String> payWithCard(CardPaymentEntity paymentData);
}

class PayByPaymobGateway implements PaymentBaseDataSource {
  final BaseDioHelper dio;
  PayByPaymobGateway(this.dio);

  @override
  Future<String> payWithCard(CardPaymentEntity paymentData) async {
    late final String authKey, orderId, paymentToken;

    final authResponse = await dio.post(
        base: ApiConstance.paymobBaseUrl,
        endPoint: ApiConstance.paymobAuthRequest,
        data: {
          'api_key': ConstantKeys.paymobApiKey,
        }) as Response;

    authKey = authResponse.data['token'];

    final orderResponse = await dio.post(
        base: ApiConstance.paymobBaseUrl,
        endPoint: ApiConstance.paymobOrderRegistration,
        data: {
          "auth_token": authKey,
          "delivery_needed": "false",
          "amount_cents": (paymentData.price * 100).toString(),
          "currency": "EGP",
          "items": [],
        }) as Response;

    orderId = orderResponse.data['id'].toString();

    final paymentKeyResponse = await dio.post(
        base: ApiConstance.paymobBaseUrl,
        endPoint: ApiConstance.paymobPaymentKeyRequest,
        data: {
          "auth_token": authKey,
          "amount_cents": (paymentData.price * 100).toString(),
          "expiration": 3600,
          "order_id": orderId,
          "billing_data": {
            "apartment": "NA",
            "email": paymentData.user.email,
            "floor": "NA",
            "first_name": paymentData.user.firstName,
            "street": "NA",
            "building": "NA",
            "phone_number": paymentData.user.phoneNumber,
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "last_name": paymentData.user.lastName,
            "state": "NA"
          },
          "currency": "EGP",
          "integration_id": ConstantKeys.paymobCardIntegrationId
        }) as Response;

    paymentToken = paymentKeyResponse.data['token'];

    return paymentToken;
  }
}
