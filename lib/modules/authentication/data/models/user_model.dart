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

  Map<String, dynamic> toJsonSignIn() => {
        'usr': email,
        'pwd': password,
      };

  Map<String, dynamic> toJsonSignUp() => {
        'phone_number': phoneNumber,
        'full_name': '$firstName $lastName',
        'first_name': firstName,
        'last_name': lastName,
        'pwd': password,
        'image': image,
        'email': email,
        'redirect_to': "/home",
      };
}
