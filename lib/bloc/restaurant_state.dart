part of 'restaurant_bloc.dart';

abstract class RestaurantState extends Equatable {
  const RestaurantState();
}

class RestaurantInitial extends RestaurantState {
  const RestaurantInitial() : super();

  @override
  List<Object> get props => [];
}
