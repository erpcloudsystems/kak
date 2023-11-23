import '../../../../core/resources/strings_manager.dart';
import '../../../../core/network/api_constance.dart';
import '../../domain/entities/meal_entity.dart';

class MealModel extends MealEntity {
  const MealModel({
    required super.description,
    required super.imageUrl,
    required super.price,
    required super.name,
    required super.id,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
        description: json['custom_arabic_description'] ??
            json['description'] ??
            StringsManager.none,
        name: json['custom_item_name_arabic'] ??
            json['item_name'] ??
            StringsManager.none,
        imageUrl: '${ApiConstance.kakUrl}${json['image']}',
        price: json['rate'] ?? 0.0,
        id: json['name'] ?? StringsManager.none,
      );
}
