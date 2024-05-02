import "package:flutter/material.dart";

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<BottomNavigationBarItem> navItems;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.navItems,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: navItems,
      // backgroundColor: Colors.purple,
    );
  }
}
