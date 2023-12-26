import '../../domain/entities/received_order_entity.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../meals/data/models/meal.dart';
import '../../../../core/utils/enums.dart';

class ReceivedOrderModel extends ReceivedOrderEntity {
  const ReceivedOrderModel({
    required super.customerAddress,
    required super.modeOfPayment,
    required super.customerName,
    required super.mobileNumber,
    required super.delivery,
    required super.items,
    required super.price,
    required super.date,
    required super.tax,
    required super.id,
  });

  factory ReceivedOrderModel.fromJson(Map<String, dynamic> json) =>
      ReceivedOrderModel(
        date: json['transaction_date'] ?? StringsManager.none,
        delivery: json['taxes'][0]['tax_amount'] ?? 0.0,
        tax: json['taxes'][1]['tax_amount'] ?? 0.0,
        customerAddress: json['address_display'] ?? StringsManager.none,
        id: json['name'] ?? StringsManager.none,
        mobileNumber: json['contact_mobile'] ?? StringsManager.none,
        customerName: json['customer_name'] ?? StringsManager.none,
        price: json['grand_total'] ?? 0.0,
        modeOfPayment: PaymentType.cash,
        items: json['items'] != null
            ? List.from(json['items'])
                .map((e) => MealModel.fromJson(e))
                .toList()
            : [],
      );
}
