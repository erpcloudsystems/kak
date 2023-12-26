import 'package:dartz/dartz.dart';

import '../models/order.dart';
import '../../domain/entities/order.dart';
import '../../../../core/network/failure.dart';
import '../datasources/payment_data_source.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/orders_list_item.dart';
import '../../domain/entities/card_payment_entity.dart';
import '../../domain/repositories/payment_base_repo.dart';
import '../../domain/entities/received_order_entity.dart';
import '../../../../core/network/helper_network_methods.dart';

class PaymentRepoImpl implements PaymentBaseRepo {
  final PaymentBaseDataSource dataSource;
  final BaseNetworkInfo networkInfo;

  const PaymentRepoImpl(this.dataSource, this.networkInfo);

  // Pay with card _________________________________________________________________
  @override
  Future<Either<Failure, String>> payWithCard(
          CardPaymentEntity paymentData) async =>
      await HelperNetworkMethods.commonApiResponseMethod<String>(
        () async => await dataSource.payWithCard(paymentData),
        networkInfo,
      );

  // Create order _________________________________________________________________
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

  // Get orders list _______________________________________________________________
  @override
  Future<Either<Failure, List<OrdersListItem>>> getOrdersList() async =>
      await HelperNetworkMethods.commonApiResponseMethod<List<OrdersListItem>>(
          () async => await dataSource.getOrdersList(), networkInfo);

  // Get order details ______________________________________________________________
  @override
  Future<Either<Failure, ReceivedOrderEntity>> getOrderDetails(
          String orderId) async =>
      await HelperNetworkMethods.commonApiResponseMethod<ReceivedOrderEntity>(
          () async => await dataSource.getOrderDetails(orderId), networkInfo);
}
