import "package:flutter/material.dart";
import 'package:new_flutter_app/util/sidebar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('About Page'),
          centerTitle: true,
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Colors.red,
            labelColor: Colors.white,
            labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(
                text: "Home",
                icon: Icon(Icons.home),
              ),
              Tab(
                text: "Profile",
                icon: Icon(Icons.person),
              ),
              Tab(
                text: "Favourites",
                icon: Icon(Icons.save),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/setting_page');
                },
                child: const Text('Go To Setting Page'),
              ),
            ),
          ],
        ),
        drawer: const Sidebar(),
      ),
    );
  }
}
