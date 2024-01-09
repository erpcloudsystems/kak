import '../../../../core/utils/enums.dart';
import 'order.dart';

class ReceivedOrderEntity extends OrderEntity {
  const ReceivedOrderEntity({
    required super.customerAddress,
    required super.modeOfPayment,
    required this.mobileNumber,
    required this.customerName,
    required this.delivery,
    required this.subTotal,
    required super.items,
    required this.status,
    required this.total,
    required this.date,
    required this.tax,
    required this.id,
  });

  final String id, customerName, date, mobileNumber;
  final double total, tax, delivery, subTotal;
  final DoctypeStatus status;

  @override
  List<Object?> get props => [
        customerAddress,
        modeOfPayment,
        customerName,
        mobileNumber,
        delivery,
        subTotal,
        status,
        total,
        items,
        date,
        tax,
        id,
      ];
}
