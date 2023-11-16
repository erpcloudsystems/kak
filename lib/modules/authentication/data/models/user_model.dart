import '../../domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.email,
    required super.password,
    required super.phoneNumber,
    required super.firstName,
    required super.lastName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'],
        password: json['password'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        phoneNumber: json['phone_number'],
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'first_name': firstName,
        'last_name': lastName,
        'phone_number': phoneNumber,
      };
}
