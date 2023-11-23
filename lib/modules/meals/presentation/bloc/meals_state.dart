part of 'meals_bloc.dart';

class MealsState extends Equatable {
  // Get offers
  final RequestState getOffersState;
  final String getOffersMessage;
  final List<MealEntity> getOffersData;

  const MealsState({
    // Get offers
    this.getOffersState = RequestState.stable,
    this.getOffersMessage = 'Get offers initial message',
    this.getOffersData = const [],
  });

  MealsState copyWith({
    // Get Offers
    RequestState? getOffersState,
    String? getOffersMessage,
    List<MealEntity>? getOffersData,
  }) =>
      MealsState(
        // Get Offers
        getOffersState: getOffersState ?? this.getOffersState,
        getOffersMessage: getOffersMessage ?? this.getOffersMessage,
        getOffersData: getOffersData ?? this.getOffersData,
      );

  @override
  List<Object> get props => [
        // Get Offers
        getOffersState,
        getOffersMessage,
        getOffersData,
      ];
}