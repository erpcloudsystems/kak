import 'package:kak/core/utils/extensions.dart';

import '../../domain/entities/meal_component.dart';
import '../../../../core/network/api_constance.dart';

class MealComponentModel extends MealComponentEntity {
  const MealComponentModel({
    required super.itemClassification,
    required super.componentType,
    required super.maxRequired,
    required super.itemName,
    required super.quantity,
    required super.image,
    required super.price,
  });

  factory MealComponentModel.fromJson(Map<String, dynamic> json) =>
      MealComponentModel(
        componentType: (json['state'].toString()).checkComponentType(),
        image: '${ApiConstance.kakUrl}${json['image']}',
        maxRequired: json['max_required'] ?? 0,
        quantity: json['qty'] ?? 0,
        price: json['rate'] ?? 0.0,
        itemName: json['item_name'] ?? json['item_name_arabic'] ?? 'none',
        itemClassification: json['item_classification'] ??
            json['item_classification_arabic'] ??
            'none',
      );

  Map<String, dynamic> toJson() => {
        'item_classification': itemClassification,
        'item_name': itemName,
        'qty': quantity,
        'rate': price,
      };
}
