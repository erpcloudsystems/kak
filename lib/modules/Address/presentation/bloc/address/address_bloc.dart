import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/enums.dart';
import '../../../domain/entities/address.dart';
import '../../../domain/usecases/delete_address.dart';
import '../../../../../core/global/base_use_case.dart';
import '../../../domain/usecases/get_all_addresses.dart';
import '../../../domain/usecases/send_user_address.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final GetAllAddressesUseCase _getAllAddressesUseCase;
  final SendUserAddressUseCase sendUserAddressUseCase;
  final DeleteAddressUseCase _deleteAddressUseCase;

  AddressBloc(
    this.sendUserAddressUseCase,
    this._getAllAddressesUseCase,
    this._deleteAddressUseCase,
  ) : super(const AddressState()) {
    on<SendUserAddressEvent>(sendUserAddress);
    on<GetAllAddressesEvent>(getAllAddresses);
    on<DeleteAddressEvent>(deleteAddress);
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

  // Delete address ________________________________________________________
  FutureOr<void> deleteAddress(
      DeleteAddressEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(deleteAddressState: RequestState.loading));

    final result = await _deleteAddressUseCase(event.addressId);

    result.fold(
      (failure) => emit(state.copyWith(
        deleteAddressState: RequestState.error,
        deleteAddressMessage: failure.errorMessage,
      )),
      (_) => emit(state.copyWith(deleteAddressState: RequestState.success)),
    );
  }
}
