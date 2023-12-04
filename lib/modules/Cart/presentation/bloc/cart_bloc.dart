import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../../../core/resources/strings_manager.dart';
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
  // double _cartTotalPrice = 0.0;

  // ____________________________________ Get cart items _______________________________
  FutureOr<void> getCartItems(
      GetCartItemsEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(getCartItemsState: RequestState.loading));
    if (_cartItems.isEmpty) {
      emit(state.copyWith(
        getCartItemsState: RequestState.error,
        getCartItemsMessage: StringsManager.noCartItemsMessage,
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
        addCartItemMessage: StringsManager.cartAddedMessage,
        totalPrice: state.totalPrice + event.meal.price,
      ));
    } catch (e) {
      emit(state.copyWith(
        addCartItemState: RequestState.error,
        addCartItemMessage: StringsManager.errorMessage,
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
        removeCartItemMessage: StringsManager.removedFromCartMessage,
        totalPrice: state.totalPrice - event.meal.price,
      ));
    } catch (e) {
      emit(state.copyWith(
        removeCartItemState: RequestState.error,
        removeCartItemMessage: StringsManager.errorMessage,
      ));
    }
  }

  // ___________________________________ Erase cart items _______________________________

  FutureOr<void> eraseCartItems(
      EraseCartItemEvent event, Emitter<CartState> emit) {
    _cartItems.clear();
    emit(state.copyWith(totalPrice: 0.0));
  }
}
