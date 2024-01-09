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
  final String? cartId;

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
    this.cartId ,
  });

  MealEntity copyWith({
    String? imageUrl,
    name,
    description,
    id,
    cartId,
    List<MealComponentEntity>? components,
    int? quantity,
    double? price,
    isMainMeal,
    priceAfterDiscount,
  }) =>
      MealEntity(
        priceAfterDiscount: priceAfterDiscount ?? priceAfterDiscount,
        description: description ?? this.description,
        isMainMeal: isMainMeal ?? this.isMainMeal,
        components: components ?? this.components,
        quantity: quantity ?? this.quantity,
        imageUrl: imageUrl ?? this.imageUrl,
        cartId: cartId ?? this.cartId,
        price: price ?? this.price,
        name: name ?? this.name,
        id: id ?? this.id,
      );

  @override
  List<Object?> get props => [
        priceAfterDiscount,
        description,
        components,
        isMainMeal,
        imageUrl,
        quantity,
        cartId,
        price,
        name,
        id,
      ];
}
