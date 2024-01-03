import 'package:equatable/equatable.dart';

class UserProfileEntity extends Equatable {
  final String mobileNo, name, email;
  final String? image;

  const UserProfileEntity({
    required this.mobileNo,
    required this.email,
    required this.image,
    required this.name,
  });

  @override
  List<Object?> get props => [
        mobileNo,
        email,
        image,
        name,
      ];
}
