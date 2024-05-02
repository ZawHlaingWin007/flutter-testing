import "package:flutter/material.dart";
import "package:new_flutter_app/pages/settings/change_password_page.dart";
import "package:new_flutter_app/pages/settings/profile_page.dart";
import "package:new_flutter_app/pages/settings/saved_items_page.dart";
// import "package:new_flutter_app/pages/settings/user_products_page.dart";
import "package:new_flutter_app/util/bottom_navbar.dart";
import "package:new_flutter_app/util/custom_appbar.dart";
import "package:new_flutter_app/util/sidebar.dart";

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final List<Widget> _pages = [
    const ProfilePage(),
    // const UserProductsPage(),
    const ChangePasswordPage(),
    const SavedItemsPage(),
  ];
  final List<BottomNavigationBarItem> _navItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_2),
      label: 'Profile',
    ),
    // const BottomNavigationBarItem(
    //   icon: Icon(Icons.shopping_cart_checkout),
    //   label: 'User Products',
    // ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.password),
      label: 'Change Password',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.save),
      label: 'Saved Items',
    ),
  ];
  int _currentIndex = 0;
  void _onTapItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Settings'),
      body: _pages[_currentIndex],
      drawer: const Sidebar(),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTapItem,
        navItems: _navItems,
      ),
    );
  }
}
