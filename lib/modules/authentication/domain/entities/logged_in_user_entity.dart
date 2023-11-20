import 'package:equatable/equatable.dart';

class LoggedInUserEntity extends Equatable {
  final String? fullName,
      name,
      username,
      sid,
      apiKey,
      apiSecret,
      email,
      image,
      phoneNumber,
      userType;
  final List<String>? role;

  const LoggedInUserEntity({
    this.fullName,
    this.name,
    this.username,
    this.role,
    this.sid,
    this.apiKey,
    this.apiSecret,
    this.email,
    this.userType,
    this.image,
    this.phoneNumber,
  });

  @override
  List<Object?> get props => [
        fullName,
        name,
        username,
        role,
        sid,
        apiKey,
        apiSecret,
        email,
        userType,
        image,
        phoneNumber,
      ];
}
