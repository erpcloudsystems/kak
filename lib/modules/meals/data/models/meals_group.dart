import '../../../../core/resources/strings_manager.dart';
import '../../../../core/network/api_constance.dart';
import '../../../../core/utils/extensions.dart';
import '../../domain/entities/meal_group.dart';

class MealsGroupModel extends MealsGroupEntity {
  const MealsGroupModel({required super.imageUrl, required super.name});

  factory MealsGroupModel.fromJson(Map<String, dynamic> json) =>
      MealsGroupModel(
        imageUrl: '${ApiConstance.mumoUrl}${json['image']}',
        name: json['item_group_name'] ??
            json['custom_item_group_arabic'] ??
            StringsWithNoCtx.none.tr(),
      );
}
