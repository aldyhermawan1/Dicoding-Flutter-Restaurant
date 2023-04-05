import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'menu_name.dart';

part 'menu.g.dart';

@JsonSerializable()
class Menu extends Equatable {
  @JsonKey(name: 'foods')
  final List<MenuName> foods;
  @JsonKey(name: 'drinks')
  final List<MenuName> drinks;

  const Menu({
    required this.foods,
    required this.drinks,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  @override
  List<Object?> get props => [foods, drinks];
}
