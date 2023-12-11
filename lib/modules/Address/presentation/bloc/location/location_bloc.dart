import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../../core/global/base_use_case.dart';
import '../../../domain/usecases/get_address_use_case.dart';
import '../../../domain/usecases/get_current_location_use_case.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetCurrentLocationUseCase _getCurrentLocationUseCase;
  final GetAddressUseCase _getAddressUseCase;

  LocationBloc(
    this._getCurrentLocationUseCase,
    this._getAddressUseCase,
  ) : super(const LocationState()) {
    on<GetCurrentLocationEvent>(getCurrentLocation);
    on<GetAddressEvent>(getAddress);
  }

  // ____________________ Current location _______________________________
  FutureOr<void> getCurrentLocation(
      GetCurrentLocationEvent event, Emitter<LocationState> emit) async {
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

  // _________________________ Get Address _______________________________
  FutureOr<void> getAddress(
      GetAddressEvent event, Emitter<LocationState> emit) async {
    emit(state.copyWith(getAddressState: RequestState.loading));

    final response = await _getAddressUseCase(event.coordinates);
    response.fold(
      (failure) => emit(state.copyWith(
        getAddressState: RequestState.error,
        getAddressMessage: failure.errorMessage,
      )),
      (address) => emit(state.copyWith(
        getAddressState: RequestState.success,
        getAddressMessage: address,
      )),
    );
  }
}
