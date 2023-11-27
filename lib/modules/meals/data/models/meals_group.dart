import '../../../../core/network/api_constance.dart';
import '../../domain/entities/meal_group.dart';

class MealsGroupModel extends MealsGroupEntity {
  const MealsGroupModel({required super.imageUrl, required super.name});

  factory MealsGroupModel.fromJson(Map<String, dynamic> json) =>
      MealsGroupModel(
        imageUrl: '${ApiConstance.kakUrl}${json['image']}',
        name: json['item_group_name'] ??
            json['custom_item_group_arabic'] ??
            'None',
      );
}
