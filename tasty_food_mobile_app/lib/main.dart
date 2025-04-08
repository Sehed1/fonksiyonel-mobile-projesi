import 'package:flutter/material.dart';
import 'package:tasty_food_mobile_app/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Initial route is set to '/'
      routes: {
        '/': (context) => HomeScreen(),
      },
    );
  }
}
