import 'package:dartz/dartz.dart';

import '../entities/card_payment_entity.dart';
import '../../../../core/network/failure.dart';
import '../entities/order.dart';

abstract class PaymentBaseRepo {
  Future<Either<Failure, String>> payWithCard(CardPaymentEntity paymentData);
  Future<Either<Failure, Unit>> createOrder(OrderEntity order);
}