import 'package:flutter/material.dart';
import 'package:new_flutter_app/util/custom_appbar.dart';
import 'package:new_flutter_app/util/sidebar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Home'),
      body: Center(
        child: Text(
          'Home',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.cyan,
          ),
        ),
      ),
      drawer: Sidebar(),
    );
  }
}
