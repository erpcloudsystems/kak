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
    List<Map<String, dynamic>> flattenedItems = [];

    // Extract every component and put it as a meal.
    for (var meal in items) {
      if (meal.components != null && meal.components!.isNotEmpty) {
        for (var component in meal.components!) {
          MealModel componentMeal = MealModel(
            description: component.itemName,
            imageUrl: component.image,
            quantity: component.quantity,
            price: component.price,
            name: component.itemName,
            id: component.itemName,
            isMainMeal: false,
          );
          flattenedItems.add(componentMeal.toJson());
        }
      }
      MealModel originalMeal = MealModel(
        priceAfterDiscount: meal.priceAfterDiscount,
        description: meal.description,
        isMainMeal: true,
        imageUrl: meal.imageUrl,
        quantity: meal.quantity,
        price: meal.price,
        name: meal.name,
        id: meal.id,
      );
      flattenedItems.add(originalMeal.toJson());
    }
    return {
      'data': {
        'transaction_date': date,
        'delivery_date': date,
        'customer_address': customerAddress,
        'mode_of_payment': modeOfPayment == PaymentType.creditCard
            ? 'Credit Card'
            : 'Cash On Delivery',
        'items': flattenedItems,
      }
    };
  }
}
