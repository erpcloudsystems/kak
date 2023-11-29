import '../../../../core/resources/strings_manager.dart';
import '../../../../core/network/api_constance.dart';
import '../../domain/entities/meal_entity.dart';
import 'meal_component.dart';

class MealModel extends MealEntity {
  const MealModel({
    required super.description,
    required super.imageUrl,
    required super.price,
    required super.name,
    required super.id,
    super.components,
    super.quantity,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
        description: json['custom_arabic_description'] ??
            json['description'] ??
            StringsManager.none,
        name: json['custom_item_name_arabic'] ??
            json['item_name'] ??
            StringsManager.none,
        imageUrl: '${ApiConstance.kakUrl}${json['image']}',
        price: double.tryParse(json['rate'].toString()) ?? 0.0,
        id: json['name'] ?? StringsManager.none,
        components: (json['details'] != null)
            ? List<MealComponentModel>.from(
                json['details'].map((e) => MealComponentModel.fromJson(e)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "item_code": id,
        "item_name": name,
        "qty": quantity,
        "rate": price,
        if (components != null && components!.isNotEmpty)
          'details': List.from(components!.map((e) {
            final mealComponent = MealComponentModel(
                itemClassification: e.itemClassification,
                componentType: e.componentType,
                maxRequired: e.maxRequired,
                itemName: e.itemName,
                quantity: e.quantity,
                image: e.image,
                price: e.price);

            return mealComponent.toJson();
          }))
      };
}
