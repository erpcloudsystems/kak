import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../../meals/domain/entities/meal_entity.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<RemoveCartItemEvent>(removeCartItem);
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
        getCartItemsMessage: 'There is no items yet in your cart!',
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
      _cartItems.add(event.meal);
      emit(state.copyWith(
        addCartItemState: RequestState.success,
        addCartItemMessage: 'Added to your cart',
      ));
    } catch (e) {
      emit(state.copyWith(
        addCartItemState: RequestState.error,
        addCartItemMessage: 'Something went wrong!',
      ));
    }
  }

  // ___________________________________ Remove cart item _______________________________

  FutureOr<void> removeCartItem(
      RemoveCartItemEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(removeCartItemState: RequestState.loading));
    try {
      _cartItems.removeWhere((element) => element.id == event.meal.id);
      emit(state.copyWith(
          removeCartItemState: RequestState.success,
          removeCartItemMessage: 'Item removed from your cart'));
    } catch (e) {
      emit(state.copyWith(
        removeCartItemState: RequestState.error,
        removeCartItemMessage: 'There is some thing went wrong!',
      ));
    }
  }

  // ___________________________________ Erase cart items _______________________________

  FutureOr<void> eraseCartItems(
      EraseCartItemEvent event, Emitter<CartState> emit) {
    _cartItems.clear();
  }
}
