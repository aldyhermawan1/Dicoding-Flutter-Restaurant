import 'package:dicoding_restaurant/data/model/restaurant.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_detail_response.g.dart';

@JsonSerializable()
class RestaurantDetailResponse extends Equatable {
  @JsonKey(name: 'error')
  final bool? error;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'restaurant')
  final Restaurant? restaurant;

  const RestaurantDetailResponse({
    this.error,
    this.message,
    this.restaurant,
  });

  factory RestaurantDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDetailResponseFromJson(json);

  @override
  List<Object?> get props => [restaurant];
}
