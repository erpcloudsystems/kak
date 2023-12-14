import 'package:dartz/dartz.dart';

import '../models/order.dart';
import '../../domain/entities/order.dart';
import '../../../../core/network/failure.dart';
import '../datasources/payment_data_source.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/card_payment_entity.dart';
import '../../domain/repositories/payment_base_repo.dart';
import '../../../../core/network/helper_network_methods.dart';

class PaymentRepoImpl implements PaymentBaseRepo {
  final PaymentBaseDataSource dataSource;
  final BaseNetworkInfo networkInfo;

  const PaymentRepoImpl(this.dataSource, this.networkInfo);

  @override
  Future<Either<Failure, String>> payWithCard(
          CardPaymentEntity paymentData) async =>
      await HelperNetworkMethods.commonApiResponseMethod<String>(
        () async => await dataSource.payWithCard(paymentData),
        networkInfo,
      );

  @override
  Future<Either<Failure, Unit>> createOrder(OrderEntity order) async {
    final orderModel = OrderModel(
      customerAddress: order.customerAddress,
      modeOfPayment: order.modeOfPayment,
      items: List.from(order.items),
    );

    final response = await HelperNetworkMethods.commonApiResponseMethod<Unit>(
      () async => await dataSource.createOrder(orderModel),
      networkInfo,
    );

    return response;
  }
}
