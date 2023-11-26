part of 'meals_bloc.dart';

abstract class MealsEvent extends Equatable {
  const MealsEvent();

  @override
  List<Object> get props => [];
}

class GetOffersEvent extends MealsEvent {}

class GetFeaturedEvent extends MealsEvent {}