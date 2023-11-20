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

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        phoneNumber: json['phone_number'],
        firstName: json['username'],
        lastName: json['full_name'],
        password: json['password'],
        email: json['email'],
        image: json['image'],
      );

  Map<String, dynamic> toJsonSignIn() => {
        'usr': email,
        'pwd': password,
      };

  Map<String, dynamic> toJsonSignUp() => {
        'phone_number': phoneNumber,
        'first_name': firstName,
        'last_name': lastName,
        'pwd': password,
        'image': image,
        'usr': email,
      };
}
