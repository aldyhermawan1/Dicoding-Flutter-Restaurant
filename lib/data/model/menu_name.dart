import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu_name.g.dart';

@JsonSerializable()
class MenuName extends Equatable {
  @JsonKey(name: 'id')
  final String name;

  const MenuName({required this.name});

  factory MenuName.fromJson(Map<String, dynamic> json) =>
      _$MenuNameFromJson(json);

  @override
  List<Object?> get props => [name];
}
