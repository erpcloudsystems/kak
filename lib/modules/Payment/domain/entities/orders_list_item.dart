import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';

class OrdersListItem extends Equatable {
  final String id, transactionDate;
  final DoctypeStatus status;
  final double price;

  const OrdersListItem({
    required this.transactionDate,
    required this.status,
    required this.price,
    required this.id,
  });

  @override
  List<Object?> get props => [
        transactionDate,
        status,
        price,
        id,
      ];
}
