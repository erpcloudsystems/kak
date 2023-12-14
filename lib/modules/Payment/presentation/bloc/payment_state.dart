part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  // Pay with card
  final RequestState payWithCardState;
  final String payWithCardToken, payWithCardMessage;

  // Create order
  final RequestState createOrderState;
  final String createOrderMessage;

  const PaymentState(
      {
      // Pay with card
      this.payWithCardState = RequestState.stable,
      this.payWithCardMessage = 'Pay With Card Initial Message',
      this.payWithCardToken = 'Pay With Card Initial Token',

      // Create order
      this.createOrderState = RequestState.stable,
      this.createOrderMessage = 'Create order initial message'});

  PaymentState copyWith({
    // Pay with card
    RequestState? payWithCardState,
    String? payWithCardMessage,
    payWithCardToken,

    // Create order
    RequestState? createOrderState,
    String? createOrderMessage,
  }) =>
      PaymentState(
        // Pay with card
        payWithCardMessage: payWithCardMessage ?? this.payWithCardMessage,
        payWithCardToken: payWithCardToken ?? this.payWithCardToken,
        payWithCardState: payWithCardState ?? this.payWithCardState,

        // Create order
        createOrderState: createOrderState ?? this.createOrderState,
        createOrderMessage: createOrderMessage ?? this.createOrderMessage,
      );

  @override
  List<Object> get props => [
        // Pay with card
        payWithCardMessage,
        payWithCardToken,
        payWithCardState,

        // Create order
        createOrderState,
        createOrderMessage,
      ];
}
