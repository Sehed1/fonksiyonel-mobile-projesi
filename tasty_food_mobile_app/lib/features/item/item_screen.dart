import 'package:flutter/material.dart';
import 'package:tasty_food_mobile_app/features/item/item_model.dart';

class FoodItemWidget extends StatefulWidget {
  final FoodItem foodItem;
  final Function(FoodItem) onAddToCart;

  const FoodItemWidget({
    Key? key,
    required this.foodItem,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  State<FoodItemWidget> createState() => _FoodItemWidgetState();
}

class _FoodItemWidgetState extends State<FoodItemWidget> {
  late FoodItem _foodItem;

  @override
  void initState() {
    super.initState();
    _foodItem = widget.foodItem;
  }

  // Function to increase quantity
  void _increaseQuantity() {
    setState(() {
      _foodItem.quantity++;
    });
  }

  // Function to decrease quantity
  void _decreaseQuantity() {
    if (_foodItem.quantity > 1) {
      setState(() {
        _foodItem.quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(_foodItem.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Name and Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _foodItem.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$${_foodItem.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Delivery Info, Time, and Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _foodItem.deliveryInfo,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    _foodItem.deliveryTime,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.star, size: 16, color: Colors.orange),
                  const SizedBox(width: 4),
                  Text(
                    _foodItem.rating.toString(),
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Description
          const Text(
            'Description',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            _foodItem.description,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          // Quantity Selector and Add to Cart Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: _decreaseQuantity,
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                  Text(
                    _foodItem.quantity.toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    onPressed: _increaseQuantity,
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () => widget.onAddToCart(_foodItem),
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Add to Cart'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Example usage in a parent widget
class FoodItemScreen extends StatelessWidget {
  const FoodItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data
    final foodItem = FoodItem(
      name: 'Burger With Meat',
      price: 12.30,
      imageUrl: 'assets/images/food_3.png', // Replace with a real image URL
      deliveryInfo: 'Free Delivery',
      deliveryTime: '20 - 30',
      rating: 4.5,
      description:
          'Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('About This Menu'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FoodItemWidget(
          foodItem: foodItem,
          onAddToCart: (item) {
            // Handle add to cart logic
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${item.name} added to cart!')),
            );
          },
        ),
      ),
    );
  }
}
