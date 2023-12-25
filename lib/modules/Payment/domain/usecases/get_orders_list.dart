import 'package:dartz/dartz.dart';

import '../entities/orders_list_item.dart';
import '../../../../core/network/failure.dart';
import '../repositories/payment_base_repo.dart';
import '../../../../core/global/base_use_case.dart';

class GetOrdersListUseCase
    extends BaseUseCase<List<OrdersListItem>, NoParameters> {
  final PaymentBaseRepo repo;
  GetOrdersListUseCase(this.repo);

  @override
  Future<Either<Failure, List<OrdersListItem>>> call(
          NoParameters parameters) async =>
      await repo.getOrdersList();
}
