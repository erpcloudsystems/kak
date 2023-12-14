import 'package:dartz/dartz.dart';

import '../models/order.dart';
import 'pay_by_paymob_gateway.dart';
import '../../../../core/network/api_constance.dart';
import '../../domain/entities/card_payment_entity.dart';

abstract class PaymentBaseDataSource {
  Future<String> payWithCard(CardPaymentEntity paymentData);
  Future<Unit> createOrder(OrderModel order);
}

class PaymentDataSourceImplByDio extends PayByPaymobGateway
    implements PaymentBaseDataSource {
  PaymentDataSourceImplByDio(super.dio);

  @override
  Future<Unit> createOrder(OrderModel order) async {
    await dio.post(
      endPoint: ApiConstance.createOrderEndPoint,
      data: order.toJson(),
      useCookies: true,
    );

    return Future.value(unit);
  }
}