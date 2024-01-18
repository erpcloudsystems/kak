import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/enums.dart';
import '../../../domain/usecases/social_sign.dart';
import '../../../domain/usecases/logout_use_case.dart';
import '../../../domain/usecases/sign_up_use_case.dart';
import '../../../domain/usecases/sign_in_use_case.dart';
import '../../../../authentication/domain/entities/user.dart';
import '../../../domain/usecases/delete_account_use_case.dart';
import '../../../domain/usecases/reset_password_use_case.dart';
import '../../../../authentication/domain/entities/logged_in_user_entity.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final ResetPasswordUseCase _resetPasswordUseCase;
  final DeleteAccountUseCase _deleteAccountUseCase;
  final SocialSignUseCase _socialSignUseCase;
  final SignUpUseCase _signUpUseCase;
  final LogoutUseCase _logoutUseCase;
  final SignInUseCase _signInUseCase;

  AuthenticationBloc(
    this._resetPasswordUseCase,
    this._deleteAccountUseCase,
    this._socialSignUseCase,
    this._logoutUseCase,
    this._signUpUseCase,
    this._signInUseCase,
  ) : super(const AuthenticationState()) {
    on<DeleteUserAccountEvent>(_deleteUserAccount);
    on<ResetPasswordEvent>(_resetPassword);
    on<SignBySocialEvent>(_socialSign);
    on<LogoutEvent>(_logout);
    on<SignUpEvent>(_signUp);
    on<SignInEvent>(_signIn);
  }
  //__________________________Sign in event_______________________________________
  FutureOr<void> _signIn(
      SignInEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(signInState: RequestState.loading));
    final result = await _signInUseCase(event.user);

    result.fold(
      (failure) => emit(state.copyWith(
          signInState: RequestState.error,
          signInMessage: failure.errorMessage)),
      (user) => emit(state.copyWith(
        signInState: RequestState.success,
        loggedInUser: user,
        isUserLoggedIn: true,
      )),
    );
  }

  //__________________________Sign up event_______________________________________
  FutureOr<void> _signUp(
      SignUpEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(signUpState: RequestState.loading));

    final result = await _signUpUseCase(event.user);

    result.fold(
      (failure) => emit(state.copyWith(
        signUpState: RequestState.error,
        signUpMessage: failure.errorMessage,
      )),
      (_) => emit(state.copyWith(
        signUpState: RequestState.success,
      )),
    );
  }

  //__________________________Reset password event_______________________________________
  FutureOr<void> _resetPassword(
      ResetPasswordEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(resetPasswordState: RequestState.loading));
    final result = await _resetPasswordUseCase(event.email);

    result.fold(
      (failure) => emit(state.copyWith(
        resetPasswordState: RequestState.error,
        resetPasswordMessage: failure.errorMessage,
      )),
      (_) => emit(state.copyWith(
        resetPasswordState: RequestState.success,
      )),
    );
  }

  //__________________________Delete user account event______________________________
  FutureOr<void> _deleteUserAccount(
      DeleteUserAccountEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(deleteUserAccountState: RequestState.loading));
    final result = await _deleteAccountUseCase(event.email);

    result.fold(
      (failure) => emit(state.copyWith(
        deleteUserAccountState: RequestState.error,
        deleteUserAccountMessage: failure.errorMessage,
      )),
      (_) => emit(state.copyWith(
        deleteUserAccountState: RequestState.success,
      )),
    );
  }

  //__________________________ Logout event _______________________________________
  FutureOr<void> _logout(
      LogoutEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(logoutState: RequestState.loading));
    final result = await _logoutUseCase(event.email);

    result.fold(
      (failure) => emit(state.copyWith(
        logoutState: RequestState.error,
        logoutMessage: failure.errorMessage,
      )),
      (_) => emit(state.copyWith(
        logoutState: RequestState.success,
        isUserLoggedIn: false,
      )),
    );
  }

  //__________________________ Social sign _______________________________________
  FutureOr<void> _socialSign(
      SignBySocialEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(signInState: RequestState.loading));

    final result = await _socialSignUseCase(event.user);

    result.fold(
      (failure) => emit(state.copyWith(
        signInState: RequestState.error,
        signInMessage: failure.errorMessage,
      )),
      (user) => emit(state.copyWith(
        signInState: RequestState.success,
        isUserLoggedIn: true,
        loggedInUser: user,
      )),
    );
  }
}
