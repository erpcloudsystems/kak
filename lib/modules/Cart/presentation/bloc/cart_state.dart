part of 'cart_bloc.dart';

class CartState extends Equatable {
  // Get cart items
  final List<MealEntity> getCartItemsData;
  final RequestState getCartItemsState;
  final String getCartItemsMessage;

  // Add cart item
  final RequestState addCartItemState;
  final String addCartItemMessage;

  // Remove cart item
  final RequestState removeCartItemState;
  final String removeCartItemMessage;

  // Total price
  final double totalPrice;

  const CartState({
    // Get
    this.getCartItemsState = RequestState.stable,
    this.getCartItemsData = const [],
    this.getCartItemsMessage = '',

    // Add
    this.addCartItemState = RequestState.stable,
    this.addCartItemMessage = '',

    // Remove
    this.removeCartItemState = RequestState.stable,
    this.removeCartItemMessage = '',

    // Total price
    this.totalPrice = 0.0,
  });

  CartState copyWith({
    // Get cart items
    List<MealEntity>? getCartItemsData,
    RequestState? getCartItemsState,
    String? getCartItemsMessage,

    // Add cart item
    RequestState? addCartItemState,
    String? addCartItemMessage,

    // Remove cart item
    RequestState? removeCartItemState,
    String? removeCartItemMessage,

    // Total price
    double? totalPrice,
  }) =>
      CartState(
        addCartItemMessage: addCartItemMessage ?? this.addCartItemMessage,
        addCartItemState: addCartItemState ?? this.addCartItemState,
        getCartItemsData: getCartItemsData ?? this.getCartItemsData,
        getCartItemsMessage: getCartItemsMessage ?? this.getCartItemsMessage,
        getCartItemsState: getCartItemsState ?? this.getCartItemsState,
        removeCartItemMessage:
            removeCartItemMessage ?? this.removeCartItemMessage,
        removeCartItemState: removeCartItemState ?? this.removeCartItemState,
        totalPrice: totalPrice ?? this.totalPrice,
      );

  @override
  List<Object> get props => [
        addCartItemMessage,
        addCartItemState,
        getCartItemsData,
        getCartItemsMessage,
        getCartItemsState,
        removeCartItemMessage,
        removeCartItemState,
        totalPrice,
      ];
}
