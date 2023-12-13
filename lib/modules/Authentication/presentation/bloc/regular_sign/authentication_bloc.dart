import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../authentication/domain/entities/logged_in_user_entity.dart';
import '../../../../authentication/domain/entities/user.dart';
import '../../../domain/usecases/logout_use_case.dart';
import '../../../domain/usecases/sign_up_use_case.dart';
import '../../../domain/usecases/sign_in_use_case.dart';
import '../../../domain/usecases/delete_account_use_case.dart';
import '../../../domain/usecases/reset_password_use_case.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final ResetPasswordUseCase resetPassword;
  final DeleteAccountUseCase deleteAccount;
  final SignUpUseCase signUp;
  final LogoutUseCase logout;
  final SignInUseCase signIn;

  AuthenticationBloc(
    this.resetPassword,
    this.deleteAccount,
    this.logout,
    this.signUp,
    this.signIn,
  ) : super(const AuthenticationState()) {
    on<DeleteUserAccountEvent>(_deleteUserAccount);
    on<ResetPasswordEvent>(_resetPassword);
    on<LogoutEvent>(_logout);
    on<SignUpEvent>(_signUp);
    on<SignInEvent>(_signIn);
  }
  //__________________________Sign in event_______________________________________
  FutureOr<void> _signIn(
      SignInEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(signInState: RequestState.loading));
    final result = await signIn(event.user);

    result.fold(
      (failure) => emit(state.copyWith(
          signInState: RequestState.error,
          signInMessage: failure.errorMessage)),
      (user) => emit(state.copyWith(
        signInState: RequestState.success,
        loggedInUser: user,
      )),
    );
  }

  //__________________________Sign up event_______________________________________
  FutureOr<void> _signUp(
      SignUpEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(signUpState: RequestState.loading));

    final result = await signUp(event.user);

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
    final result = await resetPassword(event.email);

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
  FutureOr<void> _deleteUserAccount(DeleteUserAccountEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(deleteUserAccountState: RequestState.loading));
    final result = await deleteAccount(event.email);

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
  FutureOr<void> _logout(LogoutEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(logoutState: RequestState.loading));
    final result = await logout(event.email);

    result.fold(
      (failure) => emit(state.copyWith(
        logoutState: RequestState.error,
        logoutMessage: failure.errorMessage,
      )),
      (_) => emit(state.copyWith(
        logoutState: RequestState.success,
      )),
    );
  }
}