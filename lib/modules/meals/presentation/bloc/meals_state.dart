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

  // Get meals groups
  final RequestState getMealsGroupsState;
  final String getMealsGroupsMessage;
  final List<MealsGroupEntity> getMealsGroupsData;

  // Get meal group items
  final List<MealGroupDetailsEntity> getMealGroupItemsData;
  final RequestState getMealGroupItemsState;
  final String getMealGroupItemsMessage;

  const MealsState({
    // Get offers
    this.getOffersState = RequestState.stable,
    this.getOffersMessage = 'Get offers initial message',
    this.getOffersData = const [],

    // Get Featured
    this.getFeaturedState = RequestState.stable,
    this.getFeaturedMessage = 'Get featured initial message',
    this.getFeaturedData = const [],

    // Get MealsGroups
    this.getMealsGroupsState = RequestState.stable,
    this.getMealsGroupsMessage = 'Get MealsGroups initial message',
    this.getMealsGroupsData = const [],

    // Get MealGroupItems
    this.getMealGroupItemsState = RequestState.stable,
    this.getMealGroupItemsMessage = 'Get MealGroupItems initial message',
    this.getMealGroupItemsData = const [],
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

    // Get MealsGroups
    RequestState? getMealsGroupsState,
    String? getMealsGroupsMessage,
    List<MealsGroupEntity>? getMealsGroupsData,

    // Get MealGroupItems
    RequestState? getMealGroupItemsState,
    String? getMealGroupItemsMessage,
    List<MealGroupDetailsEntity>? getMealGroupItemsData,
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

        // Get MealsGroups
        getMealsGroupsState: getMealsGroupsState ?? this.getMealsGroupsState,
        getMealsGroupsMessage:
            getMealsGroupsMessage ?? this.getMealsGroupsMessage,
        getMealsGroupsData: getMealsGroupsData ?? this.getMealsGroupsData,

        // Get MealGroupItems
        getMealGroupItemsState: getMealGroupItemsState ?? this.getMealGroupItemsState,
        getMealGroupItemsMessage:
            getMealGroupItemsMessage ?? this.getMealGroupItemsMessage,
        getMealGroupItemsData: getMealGroupItemsData ?? this.getMealGroupItemsData,
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

        // Get MealsGroups
        getMealsGroupsState,
        getMealsGroupsMessage,
        getMealsGroupsData,

        // Get MealGroupItems
        getMealGroupItemsState,
        getMealGroupItemsMessage,
        getMealGroupItemsData,
      ];
}
