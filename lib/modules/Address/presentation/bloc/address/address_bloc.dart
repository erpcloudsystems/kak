import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/enums.dart';
import '../../../domain/entities/address_creator.dart';
import '../../../domain/usecases/send_user_address.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final SendUserAddressUseCase sendUserAddressUseCase;
  AddressBloc(this.sendUserAddressUseCase) : super(const AddressState()) {
    on<SendUserAddressEvent>(sendUserAddress);
  }

  FutureOr<void> sendUserAddress(
      SendUserAddressEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(sendUserAddressState: RequestState.loading));

    final result = await sendUserAddressUseCase(event.address);

    result.fold(
      (failure) => emit(state.copyWith(
        sendUserAddressState: RequestState.error,
        sendUserAddressMessage: failure.errorMessage,
        // TODO: Remove when the add address endpoint works.
        userChosenAddress: event.address,
      )),
      (addressId) => emit(state.copyWith(
        sendUserAddressState: RequestState.success,
        userChosenAddress: event.address,
        userAddressId: addressId,
      )),
    );
  }
}
