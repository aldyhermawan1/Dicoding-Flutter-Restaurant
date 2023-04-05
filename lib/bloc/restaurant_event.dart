part of 'restaurant_bloc.dart';

abstract class RestaurantEvent extends Equatable {
  const RestaurantEvent();
}

class GetRestaurantListEvent extends RestaurantEvent {
  const GetRestaurantListEvent();

  @override
  List<Object> get props => [];
}

class GetRestaurantDetailEvent extends RestaurantEvent {
  final String id;

  const GetRestaurantDetailEvent(this.id);

  @override
  List<Object> get props => [];
}

class SearchRestaurantEvent extends RestaurantEvent {
  final String query;

  const SearchRestaurantEvent(this.query);

  @override
  List<Object> get props => [];
}
