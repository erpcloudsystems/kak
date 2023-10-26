// part of 'cart_bloc.dart';

// class CartState extends Equatable {
//   // Get cart items
//   final ReturningCartEntity getCartItemsData;
//   final RequestState getCartItemsState;
//   final String getCartItemsMessage;
// ش
//   // Update cart items
//   final ReturningCartEntity updateCartItemsData;
//   final RequestState updateCartItemsState;
//   final String updateCartItemsMessage;

//   // Add cart item
//   final RequestState addCartItemState;
//   final String addCartItemMessage;

//   // Remove cart item
//   final RequestState removeCartItemState;
//   final String removeCartItemMessage;

//   const CartState({
//     // Get
//     this.getCartItemsData = const ReturningCartEntity(items: [], total: 0),
//     this.getCartItemsState = RequestState.stable,
//     this.getCartItemsMessage = '',

//     // Update
//     this.updateCartItemsData = const ReturningCartEntity(items: [], total: 0),
//     this.updateCartItemsState = RequestState.loading,
//     this.updateCartItemsMessage = '',

//     // Add
//     this.addCartItemState = RequestState.stable,
//     this.addCartItemMessage = '',

//     // Remove
//     this.removeCartItemState = RequestState.stable,
//     this.removeCartItemMessage = '',
//   });

//   CartState copyWith({
//     // Get cart items
//     ReturningCartEntity? getCartItemsData,
//     RequestState? getCartItemsState,
//     String? getCartItemsMessage,

//     // Update cart items
//     ReturningCartEntity? updateCartItemsData,
//     RequestState? updateCartItemsState,
//     String? updateCartItemsMessage,

//     // Add cart item
//     RequestState? addCartItemState,
//     String? addCartItemMessage,

//     // Remove cart item
//     RequestState? removeCartItemState,
//     String? removeCartItemMessage,
//   }) =>
//       CartState(
//           addCartItemMessage: addCartItemMessage ?? this.addCartItemMessage,
//           addCartItemState: addCartItemState ?? this.addCartItemState,
//           getCartItemsData: getCartItemsData ?? this.getCartItemsData,
//           getCartItemsMessage: getCartItemsMessage ?? this.getCartItemsMessage,
//           getCartItemsState: getCartItemsState ?? this.getCartItemsState,
//           removeCartItemMessage:
//               removeCartItemMessage ?? this.removeCartItemMessage,
//           removeCartItemState: removeCartItemState ?? this.removeCartItemState,
//           updateCartItemsData: updateCartItemsData ?? this.updateCartItemsData,
//           updateCartItemsMessage:
//               updateCartItemsMessage ?? this.updateCartItemsMessage,
//           updateCartItemsState:
//               updateCartItemsState ?? this.updateCartItemsState);

//   @override
//   List<Object> get props => [
//         addCartItemMessage,
//         addCartItemState,
//         getCartItemsData,
//         getCartItemsMessage,
//         getCartItemsState,
//         removeCartItemMessage,
//         removeCartItemState,
//         updateCartItemsData,
//         updateCartItemsMessage,
//         updateCartItemsState,
//       ];
// }
