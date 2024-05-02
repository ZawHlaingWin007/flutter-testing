import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_flutter_app/pages/about_page.dart';
import 'package:new_flutter_app/pages/layout_page.dart';
import 'package:new_flutter_app/pages/todo_page.dart';
import 'package:new_flutter_app/pages/setting_page.dart';
import 'package:new_flutter_app/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // တခြား packages တွေရဲ့ widgets တွေကို app မ run ခင် အရင် run စေချင်ရင်သုံးပေးရတယ်။

  await Hive.initFlutter();

  // like a database, so name the database
  // then in your device local storage, there will be a little database called 'myBox'.
  await Hive.openBox('myBox');

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'First Flutter App',
      debugShowCheckedModeBanner: false,
      routes: {
        '/home_page': (context) => const HomePage(),
        '/setting_page': (context) => const SettingPage(),
        '/todo_page': (context) => const TodoPage(),
        '/about_page': (context) => const AboutPage(),
        '/layout_page': (context) => const LayoutPage(),
      },
      home: const Scaffold(
        body: HomePage(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}
