import 'package:equatable/equatable.dart';

import 'meal_component.dart';

class MealEntity extends Equatable {
  final String imageUrl, name, description, id;
  final List<MealComponentEntity>? components;
  final double? priceAfterDiscount;
  final int? quantity;
  final double price;

  // This flag to check if it is a main meal or a component one.
  final bool isMainMeal;

  const MealEntity({
    required this.description,
    this.isMainMeal = true,
    this.priceAfterDiscount,
    required this.imageUrl,
    required this.price,
    required this.name,
    required this.id,
    this.components,
    this.quantity,
  });

  @override
  List<Object?> get props => [
        priceAfterDiscount,
        description,
        components,
        isMainMeal,
        imageUrl,
        quantity,
        price,
        name,
        id,
      ];
}
