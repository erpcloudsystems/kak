import '../../../../core/resources/strings_manager.dart';
import '../../domain/entities/meal_group_details.dart';
import '../../../../core/network/api_constance.dart';

class MealGroupDetailsModel extends MealGroupDetailsEntity {
  const MealGroupDetailsModel({
    required super.description,
    required super.image,
    required super.price,
    required super.name,
    required super.id,
  });

  factory MealGroupDetailsModel.fromJson(Map<String, dynamic> json) =>
      MealGroupDetailsModel(
        description: json['description'] ??
            json['custom_arabic_description'] ??
            StringsManager.none,
        image: '${ApiConstance.kakUrl}${json['image']}',
        name: json['item_name'] ??
            json['custom_item_name_arabic'] ??
            StringsManager.none,
        price: double.tryParse(json['rate'].toString()) ?? 0.0,
        id: json['name'] ?? StringsManager.none,
      );
}
