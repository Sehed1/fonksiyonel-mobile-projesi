import 'package:flutter/material.dart';
import 'package:tasty_food_mobile_app/features/burger/burger_model.dart';
import 'package:tasty_food_mobile_app/features/burger/food_item_card.dart';

class BurgerScreen extends StatelessWidget {
  const BurgerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const items = BurgerModel.items;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: const Text('Burger'),
      ),
      body: GridView.builder(
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.77,
        ),
        itemBuilder: (context, index) {
          return FoodItemCard(
            item: items[index],
          );
        },
      ),
    );
  }
}
