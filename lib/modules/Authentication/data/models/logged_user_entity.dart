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

  factory LoggedInUserModel.fromJson(Map<String, dynamic> json) => LoggedInUserModel(
        role: List<String>.from(json["role"].map((x) => x)),
        // apiSecret: json["api_secret"]["api_secret"] ?? '',
        fullName: json["full_name"],
        userType: json["user_type"],
        username: json["username"],
        apiKey: json["api_key"],
        email: json["email"],
        name: json["name"],
        sid: json["sid"],
        
        // TODO: Not ready yet, check after finishing.
        image: json["image"],
        phoneNumber: json["phone_number"],
      );
}