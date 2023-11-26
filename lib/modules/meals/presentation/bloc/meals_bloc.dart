import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/entities/meal_entity.dart';
import '../../../../core/global/base_use_case.dart';
import '../../domain/usecases/get_offers_meals.dart';
import '../../domain/usecases/get_featured_meals.dart';

part 'meals_event.dart';
part 'meals_state.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  final GetOffersMealsUseCase _getOffersMealsUseCase;
  final GetFeaturedMealsUseCase _getFeaturedMealsUseCase;
  MealsBloc(this._getOffersMealsUseCase, this._getFeaturedMealsUseCase)
      : super(const MealsState()) {
    on<GetOffersEvent>(_getOffers);
    on<GetFeaturedEvent>(_getFeatured);
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

  FutureOr<void> _getFeatured(GetFeaturedEvent event, Emitter<MealsState> emit) async {
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
}