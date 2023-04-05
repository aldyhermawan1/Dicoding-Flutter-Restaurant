import 'package:dicoding_restaurant/data/model/restaurant.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_search_response.g.dart';

@JsonSerializable()
class RestaurantSearchResponse extends Equatable {
  @JsonKey(name: 'error')
  final bool? error;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'founded')
  final int? count;
  @JsonKey(name: 'restaurants')
  final List<Restaurant>? restaurants;

  const RestaurantSearchResponse(
      {this.error, this.message, this.count, this.restaurants});

  factory RestaurantSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantSearchResponseFromJson(json);

  @override
  List<Object?> get props => [restaurants];
}
