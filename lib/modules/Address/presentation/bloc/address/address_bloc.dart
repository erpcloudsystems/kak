import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/enums.dart';
import '../../../domain/entities/address.dart';
import '../../../domain/entities/address_creator.dart';
import '../../../../../core/global/base_use_case.dart';
import '../../../domain/usecases/get_all_addresses.dart';
import '../../../domain/usecases/send_user_address.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final SendUserAddressUseCase sendUserAddressUseCase;
  final GetAllAddressesUseCase _getAllAddressesUseCase;

  AddressBloc(
    this.sendUserAddressUseCase,
    this._getAllAddressesUseCase,
  ) : super(const AddressState()) {
    on<SendUserAddressEvent>(sendUserAddress);
    on<GetAllAddressesEvent>(getAllAddresses);
  }

  // Send User Address _____________________________________________________
  FutureOr<void> sendUserAddress(
      SendUserAddressEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(sendUserAddressState: RequestState.loading));

    final result = await sendUserAddressUseCase(event.address);

    result.fold(
      (failure) => emit(state.copyWith(
        sendUserAddressState: RequestState.error,
        sendUserAddressMessage: failure.errorMessage,
      )),
      (addressId) => emit(state.copyWith(
        sendUserAddressState: RequestState.success,
        userChosenAddress: event.address,
        userAddressId: addressId,
      )),
    );
  }

  // Get all addresses _____________________________________________________
  FutureOr<void> getAllAddresses(
      GetAllAddressesEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(getAllAddressesState: RequestState.loading));

    final result = await _getAllAddressesUseCase(const NoParameters());

    result.fold(
      (failure) => emit(state.copyWith(
        getAllAddressesState: RequestState.error,
        getAllAddressesMessage: failure.errorMessage,
      )),
      (data) => emit(state.copyWith(
        getAllAddressesState: RequestState.success,
        getAllAddressesData: data,
      )),
    );
  }
}
