import '../../../../core/network/api_constance.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../domain/entities/meal_component.dart';
import '../../domain/entities/meal_entity.dart';
import '../../../../core/utils/extensions.dart';
import 'meal_component.dart';

class MealModel extends MealEntity {
  const MealModel({
    required super.description,
    super.isMainMeal = true,
    super.priceAfterDiscount,
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
            StringsWithNoCtx.none.tr(),
        name: json['custom_item_name_arabic'] ??
            json['item_name'] ??
            StringsWithNoCtx.none.tr(),
        imageUrl: '${ApiConstance.kakUrl}${json['image']}',
        price: double.tryParse(json['rate'].toString()) ?? 0.0,
        id: json['name'] ?? StringsWithNoCtx.none.tr(),
        priceAfterDiscount:
            double.tryParse(json['custom_price_after_offer'].toString()) ?? 0.0,
        components: (json['details'] != null)
            ? List<MealComponentModel>.from(
                json['details'].map((e) => MealComponentModel.fromJson(e)))
            : [],
        quantity: int.tryParse(json['qty'].toString()) ?? 1,
        isMainMeal: true,
      );

  Map<String, dynamic> toJson() {
    String? componentsNames;
    if (components != null && components!.isNotEmpty) {
      componentsNames = extractComponentsName(components!);
    }
    return {
      "item_code": id,
      "item_name": name,
      "qty": quantity,
      "rate": price,
      "main": isMainMeal ? 1 : 0,
      if (isMainMeal) "item_details": componentsNames ?? description,
    };
  }
}

// This method extract every name for the components and put it together and send it in
// one key to the backend.
String extractComponentsName(List<MealComponentEntity> components) {
  final List<String> stringsList =
      components.map((component) => component.itemName).toList();
  final String componentsNames = stringsList.join(', ');
  return componentsNames;
}
