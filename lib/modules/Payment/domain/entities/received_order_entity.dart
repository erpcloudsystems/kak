import 'order.dart';

class ReceivedOrderEntity extends OrderEntity {
  const ReceivedOrderEntity({
    required super.customerAddress,
    required super.modeOfPayment,
    required super.items,
    required this.mobileNumber,
    required this.customerName,
    required this.delivery,
    required this.price,
    required this.date,
    required this.tax,
    required this.id,
  });

  final String id, customerName, date, mobileNumber;
  final double price, tax, delivery;

  @override
  List<Object?> get props => [
        customerAddress,
        modeOfPayment,
        customerName,
        mobileNumber,
        delivery,
        price,
        items,
        date,
        tax,
        id,
      ];
}
