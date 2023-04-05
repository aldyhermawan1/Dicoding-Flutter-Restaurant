import 'package:dicoding_restaurant/bloc/restaurant_bloc.dart';
import 'package:dicoding_restaurant/data/model/restaurant.dart';

class SearchRestaurantLoadingState extends RestaurantState {
  const SearchRestaurantLoadingState() : super();

  @override
  List<Object> get props => [];
}

class SearchRestaurantErrorState extends RestaurantState {
  final String message;

  const SearchRestaurantErrorState(this.message) : super();

  @override
  List<Object> get props => [message];
}

class SearchRestaurantSuccessState extends RestaurantState {
  final List<Restaurant> restaurants;

  const SearchRestaurantSuccessState(this.restaurants) : super();

  @override
  List<Object> get props => [];
}

class SearchRestaurantEmptyState extends RestaurantState {
  const SearchRestaurantEmptyState() : super();

  @override
  List<Object> get props => [];
}
