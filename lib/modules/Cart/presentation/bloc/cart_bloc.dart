import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../meals/domain/entities/meal_entity.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<RemoveCartItemEvent>(removeCartItem);
    on<UpdateCartItemEvent>(updateCartItem);
    on<EraseCartItemEvent>(eraseCartItems);
    on<GetCartItemsEvent>(getCartItems);
    on<AddCartItemEvent>(addCartItem);
  }

  final List<MealEntity> _cartItems = [];

  // ____________________________________ Get cart items _______________________________
  FutureOr<void> getCartItems(
      GetCartItemsEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(getCartItemsState: RequestState.loading));
    if (_cartItems.isEmpty) {
      emit(state.copyWith(
        getCartItemsState: RequestState.error,
      ));
    } else {
      emit(state.copyWith(
        getCartItemsState: RequestState.success,
        getCartItemsData: _cartItems,
      ));
    }
  }
  // ____________________________________ Add cart item ________________________________

  FutureOr<void> addCartItem(
      AddCartItemEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(addCartItemState: RequestState.loading));
    try {
      if (_cartItems.every((element) => element.cartId != event.meal.cartId)) {
        _cartItems.add(event.meal);
        emit(state.copyWith(
          addCartItemState: RequestState.success,
          totalPrice: calculateTotalPrice(),
        ));
      } else {
        emit(state.copyWith(
          addCartItemState: RequestState.error,
          addCartItemMessage: StringsWithNoCtx.existedItemInCart.tr(),
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        addCartItemState: RequestState.error,
        addCartItemMessage: StringsWithNoCtx.errorMessage.tr(),
      ));
    }
  }

  // ___________________________________ Remove cart item _______________________________

  FutureOr<void> removeCartItem(
      RemoveCartItemEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(removeCartItemState: RequestState.loading));
    try {
      _cartItems.removeWhere((element) => element.cartId == event.meal.cartId);
      emit(state.copyWith(
        removeCartItemState: RequestState.success,
        removeCartItemMessage: StringsWithNoCtx.removedFromCartMessage.tr(),
        totalPrice: calculateTotalPrice(),
      ));
    } catch (e) {
      emit(state.copyWith(
        removeCartItemState: RequestState.error,
        removeCartItemMessage: StringsWithNoCtx.errorMessage.tr(),
      ));
    }
  }

  // ___________________________________ Erase cart items _______________________________

  FutureOr<void> eraseCartItems(
      EraseCartItemEvent event, Emitter<CartState> emit) {
    _cartItems.clear();
    emit(
      state.copyWith(
        totalPrice: 0.0,
        getCartItemsData: [],
      ),
    );
  }
  // ___________________________________ Update cart item ________________________________

  FutureOr<void> updateCartItem(
      UpdateCartItemEvent event, Emitter<CartState> emit) async {
    final index =
        _cartItems.indexWhere((element) => element.cartId == event.meal.cartId);

    if (index != -1) {
      _cartItems[index] = event.meal;
      emit(state.copyWith(totalPrice: calculateTotalPrice()));
    }
  }

  // ________________________________ Calculate total price ________________________________
  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var item in _cartItems) {
      totalPrice += item.price * item.quantity!;
    }
    return totalPrice;
  }
}
