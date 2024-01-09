import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/entities/user_profile.dart';
import '../../../../core/global/base_use_case.dart';
import '../../domain/usecases/edit_user_profile.dart';
import '../../domain/usecases/get_user_profile.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final GetUserProfileUseCase _getUserProfileUseCase;
  final EditUserProfileUseCase _editUserProfileUseCase;
  UserProfileBloc(
    this._getUserProfileUseCase,
    this._editUserProfileUseCase,
  ) : super(const UserProfileState()) {
    on<GetUserProfileEvent>(getUserProfile);
    on<EditUserProfileEvent>(editUserProfile);
  }

// Get user profile _____________________________________________________________________
  FutureOr<void> getUserProfile(
      GetUserProfileEvent event, Emitter<UserProfileState> emit) async {
    emit(state.copyWith(getUserProfileState: RequestState.loading));
    final result = await _getUserProfileUseCase(const NoParameters());

    result.fold(
      (failure) => emit(state.copyWith(
        getUserProfileState: RequestState.error,
        getUserProfileMessage: failure.errorMessage,
      )),
      (userData) => emit(state.copyWith(
        getUserProfileState: RequestState.success,
        getUserProfileData: userData,
      )),
    );
  }

  // Edit user profile _____________________________________________________________________
  FutureOr<void> editUserProfile(
      EditUserProfileEvent event, Emitter<UserProfileState> emit) async {
    emit(state.copyWith(editUserProfileState: RequestState.loading));

    final result = await _editUserProfileUseCase(event.user);

    result.fold(
      (failure) => emit(state.copyWith(
        editUserProfileState: RequestState.error,
        editUserProfileMessage: failure.errorMessage,
      )),
      (_) => emit(state.copyWith(
        editUserProfileState: RequestState.success,
      )),
    );
  }
}
