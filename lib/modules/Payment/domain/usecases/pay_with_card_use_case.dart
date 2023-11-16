import 'package:dartz/dartz.dart';

import '../entities/card_payment_entity.dart';
import '../../../../core/network/failure.dart';
import '../repositories/payment_base_repo.dart';
import '../../../../core/global/base_use_case.dart';

class PayWithCardUseCase extends BaseUseCase<String, CardPaymentEntity> {
  final PaymentBaseRepo repo;

  PayWithCardUseCase(this.repo);

  @override
  Future<Either<Failure, String>> call(CardPaymentEntity parameters) async =>
      await repo.payWithCard(parameters);
}
