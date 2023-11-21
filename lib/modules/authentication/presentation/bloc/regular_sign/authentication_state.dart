part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  // Sign in state
  final LoggedInUserEntity loggedInUser;
  final RequestState signInState;
  final String signInMessage;

  // Sign up state
  final RequestState signUpState;
  final String signUpMessage;

  // Reset password
  final RequestState resetPasswordState;
  final String resetPasswordMessage;

  const AuthenticationState({
    // Sign in state
    this.signInState = RequestState.stable,
    this.signInMessage = '',
    this.loggedInUser = const LoggedInUserEntity(),

    // Sign up state
    this.signUpState = RequestState.stable,
    this.signUpMessage = '',

    // Reset password
    this.resetPasswordState = RequestState.stable,
    this.resetPasswordMessage = '',
  });

  AuthenticationState copyWith({
    // Sign in state
    LoggedInUserEntity? loggedInUser,
    RequestState? signInState,
    String? signInMessage,

    // Sign up state
    RequestState? signUpState,
    String? signUpMessage,

    // Reset password
    RequestState? resetPasswordState,
    String? resetPasswordMessage,
  }) {
    return AuthenticationState(
      // Sign in state
      signInMessage: signInMessage ?? this.signInMessage,
      signInState: signInState ?? this.signInState,
      loggedInUser: loggedInUser ?? this.loggedInUser,

      // Sign up state
      signUpMessage: signUpMessage ?? this.signUpMessage,
      signUpState: signUpState ?? this.signUpState,

      // Reset password
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
      resetPasswordMessage: resetPasswordMessage ?? this.resetPasswordMessage,
    );
  }

  @override
  List<Object> get props => [
        // Sign in state
        signInMessage,
        signInState,
        loggedInUser,

        // Sign up state
        signUpMessage,
        signUpState,

        // Reset password
        resetPasswordState,
        resetPasswordMessage,
      ];
}
