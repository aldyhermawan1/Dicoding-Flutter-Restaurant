import 'dart:async';

import 'package:dicoding_restaurant/bloc/state/fetch_restaurant_detail_state.dart';
import 'package:dicoding_restaurant/bloc/state/fetch_restaurant_list_state.dart';
import 'package:dicoding_restaurant/bloc/state/search_restaurant_state.dart';
import 'package:dicoding_restaurant/data/model/restaurant.dart';
import 'package:dicoding_restaurant/values/strings.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final Repository _repository;

  RestaurantBloc(this._repository) : super(const RestaurantInitial()) {
    on<GetRestaurantListEvent>(_onGetRestaurantListEvent);
    on<GetRestaurantDetailEvent>(_onGetRestaurantDetailEvent);
    on<SearchRestaurantEvent>(_onSearchRestaurantEvent);
  }

  Future<void> _onGetRestaurantListEvent(
    GetRestaurantListEvent event,
    Emitter<RestaurantState> emit,
  ) async {
    emit(const FetchRestaurantListLoadingState());
    try {
      List<Restaurant> result =
          (await _repository.fetchRestaurantList()) as List<Restaurant>;
      if (result.isEmpty) {
        emit(const FetchRestaurantListEmptyState());
      } else {
        emit(FetchRestaurantListSuccessState(result));
      }
    } on NetworkError {
      emit(const FetchRestaurantListErrorState(messageErrorNetwork));
    } catch (error) {
      emit(FetchRestaurantListErrorState(error.toString()));
    }
  }

  Future<void> _onGetRestaurantDetailEvent(
    GetRestaurantDetailEvent event,
    Emitter<RestaurantState> emit,
  ) async {
    emit(const FetchRestaurantDetailLoadingState());
    try {
      Restaurant result =
          (await _repository.fetchRestaurantDetail(event.id)) as Restaurant;
      emit(FetchRestaurantDetailSuccessState(result));
    } on NetworkError {
      emit(const FetchRestaurantDetailErrorState(messageErrorNetwork));
    } catch (error) {
      emit(FetchRestaurantDetailErrorState(error.toString()));
    }
  }

  Future<void> _onSearchRestaurantEvent(
    SearchRestaurantEvent event,
    Emitter<RestaurantState> emit,
  ) async {
    emit(const SearchRestaurantLoadingState());
    try {
      List<Restaurant> result = (await _repository
          .fetchRestaurantSearch(event.query)) as List<Restaurant>;
      if (result.isEmpty) {
        emit(const SearchRestaurantEmptyState());
      } else {
        emit(SearchRestaurantSuccessState(result));
      }
    } on NetworkError {
      emit(const SearchRestaurantErrorState(messageErrorNetwork));
    } catch (error) {
      emit(SearchRestaurantErrorState(error.toString()));
    }
  }
}
