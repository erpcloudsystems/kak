part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetCartItemsEvent extends CartEvent {}

class AddCartItemEvent extends CartEvent {
  final MealEntity meal;
  const AddCartItemEvent({required this.meal});

  @override
  List<Object> get props => [meal];
}

class RemoveCartItemEvent extends CartEvent {
  final MealEntity meal;
  const RemoveCartItemEvent({required this.meal});

  @override
  List<Object> get props => [meal];
}

class EraseCartItemEvent extends CartEvent {}