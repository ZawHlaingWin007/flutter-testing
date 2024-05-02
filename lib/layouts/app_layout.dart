import "package:flutter/material.dart";

class AppLayout extends StatefulWidget {
  final Widget body;
  final List navLinks;
  final String pageTitle;

  const AppLayout({
    super.key,
    required this.body,
    this.pageTitle = 'To Do App',
    this.navLinks = const [
      {
        'title': 'Home',
        'icon': Icons.home,
        'route': '/home_page',
      },
      {
        'title': 'About',
        'icon': Icons.warning_rounded,
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
    ],
  });

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  List buildSidebar(context) {
    List drawerItems = [];
    for (var link in widget.navLinks) {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pageTitle,
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
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
      ),
      body: widget.body,
    );
  }
}
