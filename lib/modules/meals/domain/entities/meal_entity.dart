import 'package:equatable/equatable.dart';

class MealEntity extends Equatable {
  final String imageUrl, name, description, id;
  final double price;

  const MealEntity({
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [
        description,
        imageUrl,
        price,
        name,
        id,
      ];
}