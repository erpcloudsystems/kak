import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';

class MealEntity extends Equatable {
  final String imageUrl, name, description;
  final double price, priceAfterDiscount;
  final List<String> additionalItems;
  final MealType mealType;
  final int quantity;

  const MealEntity({
    required this.priceAfterDiscount,
    required this.additionalItems,
    required this.description,
    required this.mealType,
    required this.quantity,
    required this.imageUrl,
    required this.price,
    required this.name,
  });

  @override
  List<Object?> get props => [
        priceAfterDiscount,
        additionalItems,
        description,
        mealType,
        quantity,
        imageUrl,
        price,
        name,
      ];
}
