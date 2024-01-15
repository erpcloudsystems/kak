part of 'social_sign_bloc.dart';

class SocialSignState extends Equatable {
  // Sign with Facebook state
  final RequestState facebookSignState;
  final String facebookSignMessage;
  final UserEntity facebookUserData;

  // Sign with Google state
  final RequestState googleSignState;
  final String googleSignMessage;
  final UserEntity googleUserData;

  const SocialSignState({
    // Sign with Facebook state
    this.facebookSignState = RequestState.stable,
    this.facebookSignMessage = '',
    this.facebookUserData = const UserEntity(email: '', password: ''),

    // Sign with Google state
    this.googleSignState = RequestState.stable,
    this.googleSignMessage = '',
    this.googleUserData = const UserEntity(
        email: '', password: '', firstName: '', lastName: '', phoneNumber: ''),
  });
  SocialSignState copyWith({
    // Sign with Facebook
    RequestState? facebookSignState,
    String? facebookSignMessage,
    UserEntity? facebookUserData,

    // Sign with Google
    RequestState? googleSignState,
    String? googleSignMessage,
    UserEntity? googleUserData,
  }) {
    return SocialSignState(
      // Sign with Facebook state
      facebookSignState: facebookSignState ?? this.facebookSignState,
      facebookSignMessage: facebookSignMessage ?? this.facebookSignMessage,
      facebookUserData: facebookUserData ?? this.facebookUserData,

      // Sign with Google state
      googleSignState: googleSignState ?? this.googleSignState,
      googleSignMessage: googleSignMessage ?? this.googleSignMessage,
      googleUserData: googleUserData ?? this.googleUserData,
    );
  }

  @override
  List<Object> get props => [
        // Sign with Facebook state
        facebookSignState,
        facebookSignMessage,
        facebookUserData,

        // Sign with Google state
        googleSignState,
        googleSignMessage,
        googleUserData,
      ];
}
