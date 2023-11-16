part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final RequestState payWithCardState;
  final String payWithCardToken, payWithCardMessage;

  const PaymentState(
      {this.payWithCardState = RequestState.stable,
      this.payWithCardMessage = 'Pay With Card Initial Message',
      this.payWithCardToken = 'Pay With Card Initial Token'});

  PaymentState copyWith({
    final RequestState? payWithCardState,
    final String? payWithCardMessage,
    payWithCardToken,
  }) =>
      PaymentState(
        payWithCardMessage: payWithCardMessage ?? this.payWithCardMessage,
        payWithCardToken: payWithCardToken ?? this.payWithCardToken,
        payWithCardState: payWithCardState ?? this.payWithCardState,
      );

  @override
  List<Object> get props => [
        payWithCardMessage,
        payWithCardToken,
        payWithCardState,
      ];
}
