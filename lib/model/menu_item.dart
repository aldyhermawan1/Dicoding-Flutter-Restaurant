class MenuItem {
  final String name;

  MenuItem({required this.name});

  factory MenuItem.fromJson(Map<String, dynamic> menuItem) => MenuItem(
        name: menuItem['name'],
      );
}
