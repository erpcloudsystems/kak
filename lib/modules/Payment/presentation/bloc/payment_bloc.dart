import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/order.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/usecases/create_order.dart';
import '../../domain/usecases/get_orders_list.dart';
import '../../../../core/global/base_use_case.dart';
import '../../domain/entities/orders_list_item.dart';
import '../../domain/entities/card_payment_entity.dart';
import '../../domain/usecases/pay_with_card_use_case.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final GetOrdersListUseCase _getOrdersListUseCase;
  final PayWithCardUseCase _payWithCardUseCase;
  final CreateOrderUseCase _createOrderUseCase;
  PaymentBloc(
    this._getOrdersListUseCase,
    this._createOrderUseCase,
    this._payWithCardUseCase,
  ) : super(const PaymentState()) {
    on<PayWithCardEvent>(payWithCard);
    on<CreateOrderEvent>(createOrder);
    on<GetOrdersListEvent>(getOrdersList);
  }

  // Pay with card ______________________________________________________
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

  // Create order ________________________________________________________
  FutureOr<void> createOrder(
      CreateOrderEvent event, Emitter<PaymentState> emit) async {
    emit(state.copyWith(createOrderState: RequestState.loading));

    final response = await _createOrderUseCase(event.order);

    response.fold(
      (failure) => emit(state.copyWith(
        createOrderState: RequestState.error,
        createOrderMessage: failure.errorMessage,
      )),
      (_) => emit(state.copyWith(createOrderState: RequestState.success)),
    );
  }

  // Get orders list ________________________________________________________
  FutureOr<void> getOrdersList(
      GetOrdersListEvent event, Emitter<PaymentState> emit) async {
    emit(state.copyWith(getOrdersListState: RequestState.loading));

    final result = await _getOrdersListUseCase(const NoParameters());

    result.fold(
      (failure) => emit(state.copyWith(
        getOrdersListState: RequestState.error,
        getOrdersListMessage: failure.errorMessage,
      )),
      (data) => emit(state.copyWith(
        getOrdersListState: RequestState.success,
        getOrdersListData: data,
      )),
    );
  }
}
