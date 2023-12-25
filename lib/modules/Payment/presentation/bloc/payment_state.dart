part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  // Pay with card
  final RequestState payWithCardState;
  final String payWithCardToken, payWithCardMessage;

  // Create order
  final RequestState createOrderState;
  final String createOrderMessage;

  // Get orders list
  final RequestState getOrdersListState;
  final String getOrdersListMessage;
  final List<OrdersListItem> getOrdersListData;

  const PaymentState({
    // Pay with card
    this.payWithCardState = RequestState.stable,
    this.payWithCardMessage = 'Pay With Card Initial Message',
    this.payWithCardToken = 'Pay With Card Initial Token',

    // Create order
    this.createOrderState = RequestState.stable,
    this.createOrderMessage = 'Create order initial message',

    // Get orders list
    this.getOrdersListState = RequestState.stable,
    this.getOrdersListMessage = 'Get orders List initial message',
    this.getOrdersListData = const [],
  });

  PaymentState copyWith({
    // Pay with card
    RequestState? payWithCardState,
    String? payWithCardMessage,
    payWithCardToken,

    // Create order
    RequestState? createOrderState,
    String? createOrderMessage,

    // Get orders list
    RequestState? getOrdersListState,
    String? getOrdersListMessage,
    List<OrdersListItem>? getOrdersListData,
  }) =>
      PaymentState(
        // Pay with card
        payWithCardMessage: payWithCardMessage ?? this.payWithCardMessage,
        payWithCardToken: payWithCardToken ?? this.payWithCardToken,
        payWithCardState: payWithCardState ?? this.payWithCardState,

        // Create order
        createOrderState: createOrderState ?? this.createOrderState,
        createOrderMessage: createOrderMessage ?? this.createOrderMessage,

        // Get orders list
        getOrdersListState: getOrdersListState ?? this.getOrdersListState,
        getOrdersListMessage: getOrdersListMessage ?? this.getOrdersListMessage,
        getOrdersListData: getOrdersListData ?? this.getOrdersListData,
      );

  @override
  List<Object> get props => [
        // Pay with card
        payWithCardMessage,
        payWithCardToken,
        payWithCardState,

        // Create order
        createOrderState,

        // Get orders list
        getOrdersListState,
        getOrdersListMessage,
        getOrdersListData,
      ];
}
