import '../../../../core/resources/strings_manager.dart';
import '../../domain/entities/received_order_entity.dart';
import '../../../../core/utils/extensions.dart';
import '../../../meals/data/models/meal.dart';
import '../../../../core/utils/enums.dart';

class ReceivedOrderModel extends ReceivedOrderEntity {
  const ReceivedOrderModel({
    required super.customerAddress,
    required super.modeOfPayment,
    required super.customerName,
    required super.mobileNumber,
    required super.delivery,
    required super.status,
    required super.items,
    required super.price,
    required super.date,
    required super.tax,
    required super.id,
  });

  factory ReceivedOrderModel.fromJson(Map<String, dynamic> json) =>
      ReceivedOrderModel(
        customerAddress: json['address_display'] ?? StringsWithNoCtx.none.tr(),
        mobileNumber: json['contact_mobile'] ?? StringsWithNoCtx.none.tr(),
        customerName: json['customer_name'] ?? StringsWithNoCtx.none.tr(),
        status: json['status'].toString().checkDoctypeStatus(),
        date: json['transaction_date'] ?? StringsWithNoCtx.none.tr(),
        delivery: json['taxes'][0]['tax_amount'] ?? 0.0,
        tax: json['taxes'][1]['tax_amount'] ?? 0.0,
        id: json['name'] ?? StringsWithNoCtx.none.tr(),
        price: json['grand_total'] ?? 0.0,
        modeOfPayment: PaymentType.cash,
        items: json['items'] != null
            ? List.from(json['items'])
                .map((e) => MealModel.fromJson(e))
                .toList()
            : [],
      );
}
