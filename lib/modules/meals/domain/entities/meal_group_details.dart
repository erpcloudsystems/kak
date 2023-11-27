import 'package:equatable/equatable.dart';

class MealGroupDetailsEntity extends Equatable {
  final String id, name, description, image;
  final double price;

  const MealGroupDetailsEntity({
    required this.description,
    required this.image,
    required this.price,
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [
        description,
        image,
        price,
        name,
        id,
      ];
}
