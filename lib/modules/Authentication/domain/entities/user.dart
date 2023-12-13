import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? firstName, lastName, phoneNumber, image;
  final String email, password;

  const UserEntity({
    required this.password,
    required this.email,
     this.phoneNumber,
     this.firstName,
     this.lastName,
     this.image,
  });

  @override
  List<Object?> get props => [
        phoneNumber,
        firstName,
        lastName,
        password,
        email,
        image,
      ];
}
