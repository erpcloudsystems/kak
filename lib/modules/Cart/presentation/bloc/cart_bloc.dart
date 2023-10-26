// import 'dart:async';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';

// import '../../domain/entities/posting_cart.dart';
// import '../../domain/usecases/add_cart_item.dart';
// import '../../domain/usecases/get_cart_items.dart';
// import '../../../../core/utils/request_state.dart';
// import '../../domain/usecases/update_cart_item.dart';
// import '../../domain/usecases/delete_cart_item.dart';
// import '../../domain/entities/returning_cart_item.dart';

// part 'cart_event.dart';
// part 'cart_state.dart';

// class CartBloc extends Bloc<CartEvent, CartState> {
//   final UpdateCartItemUseCase _updateCartItemUseCase;
//   final DeleteCartItemUseCase _deleteCartItemUseCase;
//   final GetCartItemsUseCase _getCartItemsUseCase;
//   final AddCartItemUseCase _addCartItemUseCase;

//   CartBloc(
//     this._updateCartItemUseCase,
//     this._deleteCartItemUseCase,
//     this._getCartItemsUseCase,
//     this._addCartItemUseCase,
//   ) : super(const CartState()) {
//     on<UpdateCartItemEvent>(updateCartItem);
//     on<RemoveCartItemEvent>(removeCartItem);
//     on<EraseCartItemEvent>(eraseCartItems);
//     on<GetCartItemsEvent>(getCartItems);
//     on<AddCartItemEvent>(addCartItem);
//   }

//   // ____________________________________ Get cart items _______________________________
//   FutureOr<void> getCartItems(
//       GetCartItemsEvent event, Emitter<CartState> emit) async {
//     emit(state.copyWith(getCartItemsState: RequestState.loading));
//     final result = await _getCartItemsUseCase(event.userId);

//     result.fold(
//       (failure) => emit(state.copyWith(
//         getCartItemsState: RequestState.error,
//         getCartItemsMessage: failure.errorMessage,
//       )),
//       (cartData) => emit(state.copyWith(
//         getCartItemsState: RequestState.success,
//         getCartItemsData: cartData,
//       )),
//     );
//   }
//   // ____________________________________ Add cart item ________________________________

//   FutureOr<void> addCartItem(
//       AddCartItemEvent event, Emitter<CartState> emit) async {
//     emit(state.copyWith(addCartItemState: RequestState.loading));
//     final result = await _addCartItemUseCase(event.postingCartEntity);

//     result.fold(
//       (failure) => emit(state.copyWith(
//         addCartItemState: RequestState.error,
//         addCartItemMessage: failure.errorMessage,
//       )),
//       (_) => emit(state.copyWith(addCartItemState: RequestState.success)),
//     );
//   }

//   // ___________________________________ Update cart item _______________________________

//   FutureOr<void> updateCartItem(
//       UpdateCartItemEvent event, Emitter<CartState> emit) async {
//     final result = await _updateCartItemUseCase(event.postingCartEntity);

//     result.fold(
//       (failure) => emit(state.copyWith(
//         updateCartItemsState: RequestState.error,
//         updateCartItemsMessage: failure.errorMessage,
//       )),
//       (cartData) => emit(state.copyWith(
//         updateCartItemsState: RequestState.success,
//         getCartItemsData: cartData,
//       )),
//     );
//   }

//   // ___________________________________ Remove cart item _______________________________

//   FutureOr<void> removeCartItem(
//       RemoveCartItemEvent event, Emitter<CartState> emit) async {
//     emit(state.copyWith(removeCartItemState: RequestState.loading));
//     final result = await _deleteCartItemUseCase(event.postingCartEntity);

//     result.fold(
//       (failure) => emit(state.copyWith(
//         removeCartItemState: RequestState.error,
//         removeCartItemMessage: failure.errorMessage,
//       )),
//       (cartData) => emit(state.copyWith(
//         removeCartItemState: RequestState.success,
//         getCartItemsData: cartData,
//       )),
//     );
//   }

//   // ___________________________________ Erase cart items _______________________________

//   FutureOr<void> eraseCartItems(
//       EraseCartItemEvent event, Emitter<CartState> emit) {
//     emit(state.copyWith(getCartItemsState: RequestState.loading));
//     emit(state.copyWith(
//         getCartItemsData: const ReturningCartEntity(items: [], total: 0)));
//   }
// }
