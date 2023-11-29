import 'package:kak/core/utils/extensions.dart';

import '../../domain/entities/meal_component.dart';
import '../../../../core/network/api_constance.dart';
import '../../../../core/resources/strings_manager.dart';

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
        itemName: json['item_name'] ??
            json['item_name_arabic'] ??
            StringsManager.none,
        itemClassification: json['item_classification'] ??
            json['item_classification_arabic'] ??
            StringsManager.none,
      );
}
