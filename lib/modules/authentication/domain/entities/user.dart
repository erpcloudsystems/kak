import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String email, password, firstName, lastName, phoneNumber;

  const UserEntity({
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.email,
  });

  @override
  List<Object> get props => [
        phoneNumber,
        firstName,
        lastName,
        password,
        email,
      ];
}
