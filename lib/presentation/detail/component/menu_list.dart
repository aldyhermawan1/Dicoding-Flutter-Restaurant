import 'package:flutter/material.dart';

import '../../../model/menu_name.dart';

class MenuList extends StatelessWidget {
  final List<MenuName> listMenu;
  final bool isFood;
  const MenuList({super.key, required this.listMenu, required this.isFood});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listMenu.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemBuilder: (context, index) {
        final MenuName menuName = listMenu[index];
        return menuItem(menuName.name, isFood);
      },
    );
  }
}

Widget menuItem(String name, bool isFood) {
  return Row(
    children: [
      Icon(isFood ? Icons.fastfood : Icons.liquor),
      const SizedBox(width: 8),
      Text(name, style: const TextStyle(fontSize: 11))
    ],
  );
}