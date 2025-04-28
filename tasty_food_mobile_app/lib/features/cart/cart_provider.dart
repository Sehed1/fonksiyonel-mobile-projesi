import 'package:flutter/material.dart';
import 'package:tasty_food_mobile_app/features/food_home/food_home_screen.dart';

class CartItem {
  final FoodItemModel food;
  int quantity;

  CartItem({required this.food, this.quantity = 1});
}

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  double get totalPrice => _cartItems.fold(
      0, (sum, item) => sum + (item.food.price * item.quantity));

  void addToCart(FoodItemModel food) {
    final existingItem = _cartItems.firstWhere(
      (item) => item.food.name == food.name,
      orElse: () => CartItem(food: food),
    );

    if (_cartItems.contains(existingItem)) {
      existingItem.quantity++;
    } else {
      _cartItems.add(existingItem);
    }
    notifyListeners();
  }

  void incrementQuantity(CartItem cartItem) {
    cartItem.quantity++;
    notifyListeners();
  }

  void decrementQuantity(CartItem cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
    } else {
      _cartItems.remove(cartItem);
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
