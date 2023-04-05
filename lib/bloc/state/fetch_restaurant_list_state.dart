import 'package:dicoding_restaurant/bloc/restaurant_bloc.dart';
import 'package:dicoding_restaurant/data/model/restaurant.dart';

class FetchRestaurantListLoadingState extends RestaurantState {
  const FetchRestaurantListLoadingState() : super();

  @override
  List<Object> get props => [];
}

class FetchRestaurantListErrorState extends RestaurantState {
  final String message;

  const FetchRestaurantListErrorState(this.message) : super();

  @override
  List<Object> get props => [message];
}

class FetchRestaurantListSuccessState extends RestaurantState {
  final List<Restaurant> restaurants;

  const FetchRestaurantListSuccessState(this.restaurants) : super();

  @override
  List<Object> get props => [];
}

class FetchRestaurantListEmptyState extends RestaurantState {
  const FetchRestaurantListEmptyState() : super();

  @override
  List<Object> get props => [];
}
