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
        'email': email,
        'new_password': password,
        'mobile': phoneNumber,
        'first_name': firstName,
        'last_name': lastName,
      };
}
