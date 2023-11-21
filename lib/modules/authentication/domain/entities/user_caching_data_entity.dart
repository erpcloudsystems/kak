import 'package:equatable/equatable.dart';

class UserCachingDataEntity extends Equatable {
  final String email, password;

  const UserCachingDataEntity({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
