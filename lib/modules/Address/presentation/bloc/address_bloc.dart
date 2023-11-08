import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../../../core/global/base_use_case.dart';
import '../../domain/usecases/get_current_location_use_case.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final GetCurrentLocationUseCase _getCurrentLocationUseCase;

  AddressBloc(this._getCurrentLocationUseCase) : super(const AddressState()) {
    on<GetCurrentLocationEvent>(getCurrentLocation);
  }

  FutureOr<void> getCurrentLocation(
      GetCurrentLocationEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(getCurrentLocationState: RequestState.loading));

    final result = await _getCurrentLocationUseCase(const NoParameters());
    result.fold(
      (failure) => emit(state.copyWith(
        getCurrentLocationState: RequestState.error,
        getCurrentLocationMessage: failure.errorMessage,
      )),
      (coordinates) => emit(state.copyWith(
        getCurrentLocationState: RequestState.success,
        currentLocationCoordinates: coordinates,
      )),
    );
  }
}
