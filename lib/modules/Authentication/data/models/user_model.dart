import '../../domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.password,
    required super.email,
    super.phoneNumber,
    super.firstName,
    super.lastName,
    super.image,
  });

  factory UserModel.fromFacebookMap(Map<String, dynamic> data) => UserModel(
        image: data['picture']['data']['url'],
        email: data['email'] ?? 'none',
        firstName: data['first_name'],
        lastName: data['last_name'],
        password: data['id'],
      );

  factory UserModel.fromUserEntity(UserEntity user) => UserModel(
        phoneNumber: user.phoneNumber,
        firstName: user.firstName,
        lastName: user.lastName,
        password: user.password,
        email: user.email,
        image: user.image,
      );

  Map<String, dynamic> toJsonSignIn() => {
        'usr': email,
        'pwd': password,
      };

  Map<String, dynamic> toJsonSignUp() => {
        'email': email,
        'new_password': password,
        'mobile': phoneNumber,
        'first_name': firstName,
        'last_name': lastName,
      };

  Map<String, dynamic> toSocialSignJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'id': password,
        'email': email,
        'image': image,
      };
}
