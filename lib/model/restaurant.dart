import 'dart:convert';

import 'package:fimber/fimber.dart';

import 'menu.dart';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final num rating;
  final Menu? menu;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    this.menu,
  });

  factory Restaurant.fromJson(Map<String, dynamic> restaurant) {
    return Restaurant(
      id: restaurant['id'],
      name: restaurant['name'],
      description: restaurant['description'],
      pictureId: restaurant['pictureId'],
      city: restaurant['city'],
      rating: restaurant['rating'],
      menu: Menu.fromJson(restaurant['menus']),
    );
  }
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return List.empty();
  }

  final List parsed = jsonDecode(json)['restaurants'];
  return parsed.map((e) => Restaurant.fromJson(e)).toList();
}
