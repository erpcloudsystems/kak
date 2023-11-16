import 'package:dartz/dartz.dart';

import '../entities/card_payment_entity.dart';
import '../../../../core/network/failure.dart';

abstract class PaymentBaseRepo {
  Future<Either<Failure, String>> payWithCard(CardPaymentEntity paymentData);
}