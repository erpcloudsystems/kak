part of 'user_profile_bloc.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object> get props => [];
}

class GetUserProfileEvent extends UserProfileEvent {}

class EditUserProfileEvent extends UserProfileEvent {
  final UserProfileEntity user;
  const EditUserProfileEvent({required this.user});

  @override
  List<UserProfileEntity> get props => [user];
}
