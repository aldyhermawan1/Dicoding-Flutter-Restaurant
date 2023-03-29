import 'menu_name.dart';

class Menu {
  final List<MenuName> foods;
  final List<MenuName> drinks;

  Menu({
    required this.foods,
    required this.drinks,
  });

  factory Menu.fromJson(Map<String, dynamic> menu) {
    final List foods = menu['foods'];
    final List drinks = menu['drinks'];

    return Menu(
      foods: foods.map((e) => MenuName.fromJson(e)).toList(),
      drinks: drinks.map((e) => MenuName.fromJson(e)).toList(),
    );
  }
}
