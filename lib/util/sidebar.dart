import "package:flutter/material.dart";

class Sidebar extends StatelessWidget {
  final List navLinks;

  const Sidebar({
    super.key,
    this.navLinks = const [
      {
        'title': 'Home',
        'icon': Icons.home,
        'route': '/home_page',
      },
      {
        'title': 'About',
        'icon': Icons.person,
        'route': '/about_page',
      },
      {
        'title': 'Setting',
        'icon': Icons.settings,
        'route': '/setting_page',
      },
      {
        'title': 'Todo',
        'icon': Icons.list,
        'route': '/todo_page',
      },
      {
        'title': 'Layout',
        'icon': Icons.grid_3x3,
        'route': '/layout_page',
      },
    ],
  });

  List buildSidebar(context) {
    List drawerItems = [];
    for (var link in navLinks) {
      drawerItems.add(
        Container(
          margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            color: Colors.purple[300],
          ),
          child: ListTile(
            iconColor: Colors.white54,
            textColor: Colors.white,
            leading: Icon(link['icon']),
            title: Text(
              link['title'].toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                letterSpacing: 5,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, link['route']);
            },
          ),
        ),
      );
    }
    return drawerItems;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.purple[100],
      child: Column(
        children: [
          const DrawerHeader(
            child: Icon(
              Icons.star,
              color: Colors.purple,
              size: 50,
            ),
          ),
          ...buildSidebar(context),
        ],
      ),
    );
  }
}
