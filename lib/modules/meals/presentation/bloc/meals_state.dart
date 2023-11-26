part of 'meals_bloc.dart';

class MealsState extends Equatable {
  // Get offers
  final RequestState getOffersState;
  final String getOffersMessage;
  final List<MealEntity> getOffersData;

  // Get featured
  final RequestState getFeaturedState;
  final String getFeaturedMessage;
  final List<MealEntity> getFeaturedData;

  const MealsState({
    // Get offers
    this.getOffersState = RequestState.stable,
    this.getOffersMessage = 'Get offers initial message',
    this.getOffersData = const [],

    // Get Featured
    this.getFeaturedState = RequestState.stable,
    this.getFeaturedMessage = 'Get featured initial message',
    this.getFeaturedData = const [],
  });

  MealsState copyWith({
    // Get Offers
    RequestState? getOffersState,
    String? getOffersMessage,
    List<MealEntity>? getOffersData,

    // Get Featured
    RequestState? getFeaturedState,
    String? getFeaturedMessage,
    List<MealEntity>? getFeaturedData,
  }) =>
      MealsState(
        // Get Offers
        getOffersState: getOffersState ?? this.getOffersState,
        getOffersMessage: getOffersMessage ?? this.getOffersMessage,
        getOffersData: getOffersData ?? this.getOffersData,

        // Get Featured
        getFeaturedState: getFeaturedState ?? this.getFeaturedState,
        getFeaturedMessage: getFeaturedMessage ?? this.getFeaturedMessage,
        getFeaturedData: getFeaturedData ?? this.getFeaturedData,
      );

  @override
  List<Object> get props => [
        // Get Offers
        getOffersState,
        getOffersMessage,
        getOffersData,

        // Get Featured
        getFeaturedState,
        getFeaturedMessage,
        getFeaturedData,
      ];
}