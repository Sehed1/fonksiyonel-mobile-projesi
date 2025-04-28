import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasty_food_mobile_app/features/cart/cart_provider.dart';
import 'package:tasty_food_mobile_app/features/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tasty Food App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
