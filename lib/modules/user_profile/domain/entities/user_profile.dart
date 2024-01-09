import 'package:equatable/equatable.dart';

class UserProfileEntity extends Equatable {
  final String mobileNo, firstName, email, address, lastName;
  final String? image, fileName;

  const UserProfileEntity({
    required this.firstName,
    required this.lastName,
    required this.mobileNo,
    required this.address,
    required this.email,
    required this.image,
    this.fileName,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        fileName,
        mobileNo,
        address,
        email,
        image,
      ];
}
