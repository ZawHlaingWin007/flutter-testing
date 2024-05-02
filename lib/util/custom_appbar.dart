import "package:flutter/material.dart";

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    this.title = 'To Do App',
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
      ),
      centerTitle: true,
      backgroundColor: Colors.purple,
      foregroundColor: Colors.white,
    );
  }
}
