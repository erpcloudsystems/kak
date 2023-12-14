import 'package:dartz/dartz.dart';

import '../entities/order.dart';
import '../../../../core/network/failure.dart';
import '../repositories/payment_base_repo.dart';
import '../../../../core/global/base_use_case.dart';

class CreateOrderUseCase extends BaseUseCase<Unit, OrderEntity> {
  final PaymentBaseRepo repo;

  CreateOrderUseCase(this.repo);

  @override
  Future<Either<Failure, Unit>> call(OrderEntity parameters) async =>
      await repo.createOrder(parameters);
}
