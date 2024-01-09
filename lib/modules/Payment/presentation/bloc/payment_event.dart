part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class PayWithCardEvent extends PaymentEvent {
  final CardPaymentEntity paymentData;

  const PayWithCardEvent({required this.paymentData});

  @override
  List<Object> get props => [paymentData];
}

class CreateOrderEvent extends PaymentEvent {
  final OrderEntity order;
  const CreateOrderEvent({required this.order});

  @override
  List<Object> get props => [order];
}

class GetOrderDetailsEvent extends PaymentEvent {
  final String orderId;
  const GetOrderDetailsEvent({required this.orderId});

  @override
  List<Object> get props => [orderId];
}

class GetOrdersListEvent extends PaymentEvent {}

class GetTaxesEvent extends PaymentEvent {}
