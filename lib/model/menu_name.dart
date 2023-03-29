class MenuName {
  final String name;

  MenuName({required this.name});

  factory MenuName.fromJson(Map<String, dynamic> menuItem) => MenuName(
        name: menuItem['name'],
      );
}
