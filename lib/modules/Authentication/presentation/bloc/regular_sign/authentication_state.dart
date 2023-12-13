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

  // Logout
  final RequestState logoutState;
  final String logoutMessage;

  // Delete user account
  final RequestState deleteUserAccountState;
  final String deleteUserAccountMessage;

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

    // Logout
    this.logoutState = RequestState.stable,
    this.logoutMessage = '',

    // Delete user account
    this.deleteUserAccountState = RequestState.stable,
    this.deleteUserAccountMessage = '',
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

    // Logout
    RequestState? logoutState,
    String? logoutMessage,

    // Delete user account
    RequestState? deleteUserAccountState,
    String? deleteUserAccountMessage,
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

      // Logout
      logoutState: logoutState ?? this.logoutState,
      logoutMessage: logoutMessage ?? this.logoutMessage,

      // Delete user account
      deleteUserAccountState: deleteUserAccountState ?? this.deleteUserAccountState,
      deleteUserAccountMessage: deleteUserAccountMessage ?? this.deleteUserAccountMessage,
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

        // Logout
        logoutState,
        logoutMessage,

        // Delete user account
        deleteUserAccountState,
        deleteUserAccountMessage,
      ];
}
