import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/entities/card_payment_entity.dart';
import '../../domain/usecases/pay_with_card_use_case.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PayWithCardUseCase _payWithCardUseCase;
  PaymentBloc(this._payWithCardUseCase) : super(const PaymentState()) {
    on<PayWithCardEvent>(payWithCard);
  }

  FutureOr<void> payWithCard(
      PayWithCardEvent event, Emitter<PaymentState> emit) async {
    emit(state.copyWith(payWithCardState: RequestState.loading));

    final response = await _payWithCardUseCase(event.paymentData);

    response.fold(
      (failure) => emit(state.copyWith(
        payWithCardState: RequestState.error,
        payWithCardMessage: failure.errorMessage,
      )),
      (token) => emit(state.copyWith(
        payWithCardState: RequestState.success,
        payWithCardToken: token,
      )),
    );
  }
}
