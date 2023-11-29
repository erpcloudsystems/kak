import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';

class MealComponentEntity extends Equatable {
  final String itemClassification, itemName, image;
  final ComponentType componentType;
  final int quantity, maxRequired;
  final double price;

  const MealComponentEntity({
    required this.itemClassification,
    required this.componentType,
    required this.maxRequired,
    required this.quantity,
    required this.itemName,
    required this.image,
    required this.price,
  });

  @override
  List<Object?> get props => [
        itemClassification,
        componentType,
        maxRequired,
        quantity,
        itemName,
        image,
        price,
      ];
}
