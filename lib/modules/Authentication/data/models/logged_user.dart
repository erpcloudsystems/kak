import '../../domain/entities/logged_in_user_entity.dart';

class LoggedInUserModel extends LoggedInUserEntity {
  const LoggedInUserModel({
    super.phoneNumber,
    super.apiSecret,
    super.fullName,
    super.userType,
    super.username,
    super.apiKey,
    super.name,
    super.role,
    super.image,
    super.email,
    super.sid,
  });

  factory LoggedInUserModel.fromJson(Map<String, dynamic> json) =>
      LoggedInUserModel(
        role: List<String>.from(json["role"].map((x) => x)),
        phoneNumber: json["phone_number"],
        fullName: '${json["first_name"]} ${json["last_name"]}',
        userType: json["user_type"],
        username: json["username"],
        image: json["user_image"],
        apiKey: json["api_key"],
        email: json["email"],
        name: json["name"],
        sid: json["sid"],
      );
}
