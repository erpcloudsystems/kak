import '../../domain/entities/orders_list_item.dart';
import '../../../../core/utils/extensions.dart';

final class OrdersListItemModel extends OrdersListItem {
  const OrdersListItemModel({
    required super.transactionDate,
    required super.status,
    required super.price,
    required super.id,
  });

  factory OrdersListItemModel.fromJson(Map<String, dynamic> json) =>
      OrdersListItemModel(
        transactionDate: json['transaction_date'] ?? 'none',
        status: json['status'].toString().checkDoctypeStatus(),
        id: json['name'] ?? 'none',
        price: json['grand_total'] ?? 0.0,
      );
}
