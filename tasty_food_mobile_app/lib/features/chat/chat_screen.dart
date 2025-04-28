import 'package:flutter/material.dart';
import 'package:tasty_food_mobile_app/features/widgets/category_buttons.dart';

class ChatScreen extends StatelessWidget {
  final Function(String) onCategorySelected;
  final Function(int) onItemTapped;

  const ChatScreen({
    super.key,
    required this.onCategorySelected,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat Screen')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Find by Category',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          CategoryButtons(
            initialCategory: 'Burger',
            onCategorySelected: (category) {
              onCategorySelected(category);
              onItemTapped(0);
            },
          ),
          const Expanded(
            child: Center(child: Text('This is the chat screen')),
          ),
        ],
      ),
    );
  }
}
