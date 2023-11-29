import 'package:equatable/equatable.dart';

import 'meal_component.dart';

class MealEntity extends Equatable {
  final String imageUrl, name, description, id;
  final List<MealComponentEntity>? components;
  final double price;

  const MealEntity( {
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.name,
    required this.id,
    this.components,
  });

  @override
  List<Object?> get props => [
        description,
        components,
        imageUrl,
        price,
        name,
        id,
      ];
}