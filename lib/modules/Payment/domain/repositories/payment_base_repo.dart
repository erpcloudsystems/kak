import 'package:dartz/dartz.dart';

import '../entities/received_order_entity.dart';
import '../../../../core/network/failure.dart';
import '../entities/card_payment_entity.dart';
import '../entities/orders_list_item.dart';
import '../entities/taxes.dart';
import '../entities/order.dart';

abstract class PaymentBaseRepo {
  Future<Either<Failure, ReceivedOrderEntity>> getOrderDetails(String orderId);
  Future<Either<Failure, String>> payWithCard(CardPaymentEntity paymentData);
  Future<Either<Failure, List<OrdersListItem>>> getOrdersList();
  Future<Either<Failure, Unit>> createOrder(OrderEntity order);
  Future<Either<Failure,TaxesEntity>> getTaxes();
}