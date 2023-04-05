import 'package:dicoding_restaurant/data/model/restaurant.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_list_response.g.dart';

@JsonSerializable()
class RestaurantListResponse extends Equatable {
  @JsonKey(name: 'error')
  final bool? error;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'count')
  final int? count;
  @JsonKey(name: 'restaurants')
  final List<Restaurant>? restaurants;

  const RestaurantListResponse({
    this.error,
    this.message,
    this.count,
    this.restaurants,
  });

  factory RestaurantListResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantListResponseFromJson(json);

  @override
  List<Object?> get props => [restaurants];
}
