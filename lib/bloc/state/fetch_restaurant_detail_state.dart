import 'package:dicoding_restaurant/bloc/restaurant_bloc.dart';
import 'package:dicoding_restaurant/data/model/restaurant.dart';

class FetchRestaurantDetailLoadingState extends RestaurantState {
  const FetchRestaurantDetailLoadingState() : super();

  @override
  List<Object> get props => [];
}

class FetchRestaurantDetailErrorState extends RestaurantState {
  final String message;

  const FetchRestaurantDetailErrorState(this.message) : super();

  @override
  List<Object> get props => [message];
}

class FetchRestaurantDetailSuccessState extends RestaurantState {
  final Restaurant restaurant;

  const FetchRestaurantDetailSuccessState(this.restaurant) : super();

  @override
  List<Object> get props => [];
}

class FetchRestaurantDetailEmptyState extends RestaurantState {
  const FetchRestaurantDetailEmptyState() : super();

  @override
  List<Object> get props => [];
}
