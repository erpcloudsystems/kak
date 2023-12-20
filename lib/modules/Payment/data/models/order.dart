import '../../../../core/utils/extensions.dart';
import '../../../meals/data/models/meal.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/order.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.customerAddress,
    required super.modeOfPayment,
    required super.items,
  });

  Map<String, dynamic> toJson() {
    final date = DateTime.now().formatDateYMD();
    return {
      'data': {
        'transaction_date': date,
        'delivery_date': date,
        'customer_address': customerAddress,
        'mode_of_payment': modeOfPayment == PaymentType.creditCard
            ? 'Credit Card'
            : 'Cash On Delivery',
        'items': items.map((e) {
          MealModel meal = MealModel(
            priceAfterDiscount: e.priceAfterDiscount,
            description: e.description,
            components: e.components,
            imageUrl: e.imageUrl,
            quantity: e.quantity,
            price: e.price,
            name: e.name,
            id: e.id,
          );
          return meal.toJson();
        }).toList(),
      }
    };
  }
}
