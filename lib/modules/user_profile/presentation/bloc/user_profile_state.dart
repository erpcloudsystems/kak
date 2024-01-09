part of 'user_profile_bloc.dart';

class UserProfileState extends Equatable {
  // Get user profile
  final UserProfileEntity getUserProfileData;
  final RequestState getUserProfileState;
  final String getUserProfileMessage;

  // Edit user profile
  final RequestState editUserProfileState;
  final String editUserProfileMessage;

  const UserProfileState({
    // Edit user profile
    this.editUserProfileMessage = 'edit user profile initial message',
    this.editUserProfileState = RequestState.stable,

    // Get user profile
    this.getUserProfileMessage = 'get user profile initial message',
    this.getUserProfileState = RequestState.stable,
    this.getUserProfileData = const UserProfileEntity(
      mobileNo: 'mobileNo',
      address: 'address',
      email: 'email',
      name: 'name',
      image: null,
    ),
  });

  UserProfileState copyWith({
    // Get user profile
    UserProfileEntity? getUserProfileData,
    RequestState? getUserProfileState,
    String? getUserProfileMessage,

    // Edit user profile
    RequestState? editUserProfileState,
    String? editUserProfileMessage,
  }) =>
      UserProfileState(
        // Get user profile
        getUserProfileState: getUserProfileState ?? this.getUserProfileState,
        getUserProfileData: getUserProfileData ?? this.getUserProfileData,
        getUserProfileMessage:
            getUserProfileMessage ?? this.getUserProfileMessage,

        // Edit user profile
        editUserProfileState: editUserProfileState ?? this.editUserProfileState,
        editUserProfileMessage:
            editUserProfileMessage ?? this.editUserProfileMessage,
      );

  @override
  List<Object> get props => [
        // Get user profile
        getUserProfileMessage,
        getUserProfileState,
        getUserProfileData,
        
        // edit user profile
        editUserProfileMessage,
        editUserProfileState,
      ];
}
