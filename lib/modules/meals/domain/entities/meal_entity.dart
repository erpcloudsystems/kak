import 'package:equatable/equatable.dart';

import 'meal_component.dart';

class MealEntity extends Equatable {
  final String imageUrl, name, description, id;
  final List<MealComponentEntity>? components;
  final double? priceAfterDiscount;
  final int? quantity;
  final double price;

  const MealEntity({
    required this.description,
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
        imageUrl,
        quantity,
        price,
        name,
        id,
      ];
}
