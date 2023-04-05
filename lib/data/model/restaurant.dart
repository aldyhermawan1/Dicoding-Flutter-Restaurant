import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'menu.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurant extends Equatable{
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'pictureId')
  final String pictureId;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'city')
  final String city;
  @JsonKey(name: 'rating')
  final num rating;
  @JsonKey(name: 'menu')
  final Menu? menu;

  const Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    this.address,
    required this.city,
    required this.rating,
    this.menu,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  @override
  List<Object?> get props => [
    id, name, description, pictureId, address, city, rating, menu
  ];
}
