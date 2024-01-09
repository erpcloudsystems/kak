import '../../../../core/resources/strings_manager.dart';
import '../../domain/entities/user_profile.dart';
import '../../../../core/utils/extensions.dart';

class UserProfileModel extends UserProfileEntity {
  const UserProfileModel({
    required super.firstName,
    required super.lastName,
    required super.mobileNo,
    required super.address,
    required super.email,
    required super.image,
    super.fileName,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        mobileNo: json['mobile_no'] ?? StringsWithNoCtx.none.tr(),
        address: json['addresses'] ?? StringsWithNoCtx.none.tr(),
        firstName: json['first_name'] ?? StringsWithNoCtx.none.tr(),
        lastName: json['last_name'] ?? StringsWithNoCtx.none.tr(),
        email: json['email'] ?? StringsWithNoCtx.none.tr(),
        image: json['user_image'],
      );

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'mobile_no': mobileNo,
        'last_name': lastName,
        if (image != null) 'image_content': image,
        if (fileName != null) 'filename': fileName,
      };
}
