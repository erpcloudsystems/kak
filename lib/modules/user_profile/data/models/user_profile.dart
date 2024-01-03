import '../../../../core/resources/strings_manager.dart';
import '../../domain/entities/user_profile.dart';
import '../../../../core/utils/extensions.dart';

class UserProfileModel extends UserProfileEntity {
  const UserProfileModel({
    required super.mobileNo,
    required super.email,
    required super.image,
    required super.name,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        mobileNo: json['mobile_no'] ?? StringsWithNoCtx.none.tr(),
        email: json['first_name'] ?? StringsWithNoCtx.none.tr,
        name: json['email'] ?? StringsWithNoCtx.none.tr,
        image: json['user_image'],
      );
}
