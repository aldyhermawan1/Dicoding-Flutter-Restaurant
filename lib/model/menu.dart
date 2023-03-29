import 'dart:convert';

import 'package:fimber/fimber.dart';

import 'menu_item.dart';

class Menu {
  final List<MenuItem> foods;
  final List<MenuItem> drinks;

  Menu({
    required this.foods,
    required this.drinks,
  });

  factory Menu.fromJson(Map<String, dynamic> menu) {
    final List foods = menu['foods'];
    final List drinks = menu['drinks'];

    return Menu(
      foods: foods.map((e) => MenuItem.fromJson(e)).toList(),
      drinks: drinks.map((e) => MenuItem.fromJson(e)).toList(),
    );
  }
}
