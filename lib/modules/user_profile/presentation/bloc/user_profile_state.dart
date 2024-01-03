part of 'user_profile_bloc.dart';

class UserProfileState extends Equatable {
  // Get user profile
  final UserProfileEntity getUserProfileData;
  final RequestState getUserProfileState;
  final String getUserProfileMessage;

  const UserProfileState({
    // Get user profile
    this.getUserProfileMessage = 'get user profile initial message',
    this.getUserProfileState = RequestState.stable,
    this.getUserProfileData = const UserProfileEntity(
        mobileNo: 'mobileNo', email: 'email', name: 'name', image: null),
  });

  UserProfileState copyWith({
    // Get user profile
    UserProfileEntity? getUserProfileData,
    RequestState? getUserProfileState,
    String? getUserProfileMessage,
  }) =>
      UserProfileState(
        // Get user profile
        getUserProfileState: getUserProfileState ?? this.getUserProfileState,
        getUserProfileData: getUserProfileData ?? this.getUserProfileData,
        getUserProfileMessage:
            getUserProfileMessage ?? this.getUserProfileMessage,
      );

  @override
  List<Object> get props => [
        // Get user profile
        getUserProfileMessage,
        getUserProfileState,
        getUserProfileData,
      ];
}
