import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/order.dart';
import 'pay_by_paymob_gateway.dart';
import '../models/received_order.dart';
import '../models/orders_list_item.dart';
import '../../../../core/network/api_constance.dart';
import '../../domain/entities/card_payment_entity.dart';

abstract class PaymentBaseDataSource {
  Future<ReceivedOrderModel> getOrderDetails(String orderId);
  Future<String> payWithCard(CardPaymentEntity paymentData);
  Future<List<OrdersListItemModel>> getOrdersList();
  Future<Unit> createOrder(OrderModel order);
}

class PaymentDataSourceImplByDio extends PayByPaymobGateway
    implements PaymentBaseDataSource {
  PaymentDataSourceImplByDio(super.dio);

  // Create order ________________________________________________
  @override
  Future<Unit> createOrder(OrderModel order) async {
    await dio.post(
      endPoint: ApiConstance.createOrderEndPoint,
      data: order.toJson(),
      useCookies: true,
    );

    return Future.value(unit);
  }

  // Get orders lists ________________________________________________
  @override
  Future<List<OrdersListItemModel>> getOrdersList() async {
    final response =
        await dio.get(endPoint: ApiConstance.getOrdersListEndPoint) as Response;

    final list = List.from(response.data['message'])
        .map((e) => OrdersListItemModel.fromJson(e))
        .toList();

    return list;
  }

  // Get order details ________________________________________________
  @override
  Future<ReceivedOrderModel> getOrderDetails(String orderId) async {
    final response = await dio.get(
      endPoint: ApiConstance.getOrderDetailsEndPoint,
      query: {'order': orderId},
    ) as Response;

    final order = ReceivedOrderModel.fromJson(response.data['message'][0]);

    return order;
  }
}
