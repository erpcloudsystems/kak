import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../entities/received_order_entity.dart';
import '../repositories/payment_base_repo.dart';
import '../../../../core/global/base_use_case.dart';

class GetOrderDetailsUseCase extends BaseUseCase<ReceivedOrderEntity, String> {
  final PaymentBaseRepo repo;
  GetOrderDetailsUseCase(this.repo);

  @override
  Future<Either<Failure, ReceivedOrderEntity>> call(String parameters) async =>
      await repo.getOrderDetails(parameters);
}
