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
