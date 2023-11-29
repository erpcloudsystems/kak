import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/entities/meal_group.dart';
import '../../domain/entities/meal_entity.dart';
import '../../../../core/global/base_use_case.dart';
import '../../domain/usecases/get_meal_details.dart';
import '../../domain/usecases/get_offers_meals.dart';
import '../../domain/usecases/get_meals_groups.dart';
import '../../domain/entities/meal_group_details.dart';
import '../../domain/usecases/get_featured_meals.dart';
import '../../domain/usecases/get_meal_group_items.dart';

part 'meals_event.dart';
part 'meals_state.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  final GetMealGroupItemsUseCase _getMealGroupItemsUseCase;
  final GetFeaturedMealsUseCase _getFeaturedMealsUseCase;
  final GetOffersMealsUseCase _getOffersMealsUseCase;
  final GetMealsGroupsUseCase _getMealsGroupsUseCase;
  final GetMealDetailsUseCase _getMealDetailsUseCase;

  MealsBloc(
    this._getMealGroupItemsUseCase,
    this._getFeaturedMealsUseCase,
    this._getOffersMealsUseCase,
    this._getMealsGroupsUseCase,
    this._getMealDetailsUseCase,
  ) : super(const MealsState()) {
    on<GetOffersEvent>(_getOffers);
    on<GetFeaturedEvent>(_getFeatured);
    on<GetMealsGroupsEvent>(_getMealsGroups);
    on<GetMealGroupItemsEvent>(_getMealGroupItems);
    on<GetMealDetailsEvent>(_getMealDetails);
  }

  FutureOr<void> _getOffers(
      GetOffersEvent event, Emitter<MealsState> emit) async {
    emit(state.copyWith(getOffersState: RequestState.loading));

    final response = await _getOffersMealsUseCase(const NoParameters());

    response.fold(
      (failure) => emit(state.copyWith(
        getOffersState: RequestState.error,
        getOffersMessage: failure.errorMessage,
      )),
      (data) => emit(state.copyWith(
        getOffersState: RequestState.success,
        getOffersData: data,
      )),
    );
  }

  FutureOr<void> _getFeatured(
      GetFeaturedEvent event, Emitter<MealsState> emit) async {
    emit(state.copyWith(getFeaturedState: RequestState.loading));

    final response = await _getFeaturedMealsUseCase(const NoParameters());

    response.fold(
      (failure) => emit(state.copyWith(
        getFeaturedState: RequestState.error,
        getFeaturedMessage: failure.errorMessage,
      )),
      (data) => emit(state.copyWith(
        getFeaturedState: RequestState.success,
        getFeaturedData: data,
      )),
    );
  }

  FutureOr<void> _getMealsGroups(
      GetMealsGroupsEvent event, Emitter<MealsState> emit) async {
    emit(state.copyWith(getMealsGroupsState: RequestState.loading));

    final response = await _getMealsGroupsUseCase(const NoParameters());

    response.fold(
      (failure) => emit(state.copyWith(
        getMealsGroupsState: RequestState.error,
        getMealsGroupsMessage: failure.errorMessage,
      )),
      (data) => emit(state.copyWith(
        getMealsGroupsState: RequestState.success,
        getMealsGroupsData: data,
      )),
    );
  }

  FutureOr<void> _getMealGroupItems(
      GetMealGroupItemsEvent event, Emitter<MealsState> emit) async {
    emit(state.copyWith(getMealGroupItemsState: RequestState.loading));

    final response = await _getMealGroupItemsUseCase(event.groupName);

    response.fold(
      (failure) => emit(state.copyWith(
        getMealGroupItemsState: RequestState.error,
        getMealGroupItemsMessage: failure.errorMessage,
      )),
      (data) => emit(state.copyWith(
        getMealGroupItemsState: RequestState.success,
        getMealGroupItemsData: data,
      )),
    );
  }

  FutureOr<void> _getMealDetails(
      GetMealDetailsEvent event, Emitter<MealsState> emit) async {
    emit(state.copyWith(getMealDetailsState: RequestState.loading));

    final response = await _getMealDetailsUseCase(event.mealName);

    response.fold(
      (failure) => emit(state.copyWith(
        getMealDetailsState: RequestState.error,
        getMealDetailsMessage: failure.errorMessage,
      )),
      (data) => emit(state.copyWith(
        getMealDetailsState: RequestState.success,
        getMealDetailsData: data,
      )),
    );
  }
}
