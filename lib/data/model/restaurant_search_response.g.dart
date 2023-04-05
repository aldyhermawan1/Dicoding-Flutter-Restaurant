// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantSearchResponse _$RestaurantSearchResponseFromJson(
        Map<String, dynamic> json) =>
    RestaurantSearchResponse(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      count: json['founded'] as int?,
      restaurants: (json['restaurants'] as List<dynamic>?)
          ?.map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantSearchResponseToJson(
        RestaurantSearchResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'founded': instance.count,
      'restaurants': instance.restaurants,
    };
