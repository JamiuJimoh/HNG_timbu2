import 'package:flutter/material.dart';
import 'package:timbu/src/utils/app_colors.dart';

import 'nav_item.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar(
      {super.key, required this.navItem, required this.onTabSelected});
  final List<NavItem> navItem;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      decoration: BoxDecoration(
        color: kTabColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(navItem.length, (i) {
            return GestureDetector(
              onTap: () => onTabSelected(i),
              child: navItem[i],
            );
          })
        ],
      ),
    );
  }
}
