part of 'meals_bloc.dart';

abstract class MealsEvent extends Equatable {
  const MealsEvent();

  @override
  List<Object> get props => [];
}

class GetOffersEvent extends MealsEvent {}

class GetFeaturedEvent extends MealsEvent {}

class GetMealsGroupsEvent extends MealsEvent {}

class GetMealGroupItemsEvent extends MealsEvent {
  final String groupName;
  const GetMealGroupItemsEvent({required this.groupName});
}

class GetMealDetailsEvent extends MealsEvent {
  final String mealName;
  const GetMealDetailsEvent({required this.mealName});
}
