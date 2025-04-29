import 'package:flutter/material.dart';
import 'package:tasty_food_mobile_app/features/appbar/NotificationsPage.dart';
import 'package:tasty_food_mobile_app/features/chat/chat_screen.dart';
import 'package:tasty_food_mobile_app/features/food_detail/food_detail_screen.dart';
import 'package:tasty_food_mobile_app/features/order/order_screen.dart';
import 'package:tasty_food_mobile_app/features/profile/profile_screen.dart';

// FoodItemModel class with description field
class FoodItemModel {
  final String name;
  final String imagePath;
  final double rating;
  final double price;
  final String category;
  final String description;

  FoodItemModel({
    required this.name,
    required this.imagePath,
    required this.rating,
    required this.price,
    required this.category,
    this.description = '',
  });
}

class FoodHomeScreen extends StatefulWidget {
  const FoodHomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FoodHomeScreenState createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen> {
  final List<FoodItemModel> foodItems = [
    // Burgers
    FoodItemModel(
      name: 'Classic Cheeseburger',
      imagePath: 'assets/images/food_40.jpeg',
      rating: 4.8,
      price: 15.990,
      category: 'Salad',
      description:
          'Juicy beef patty with melted cheddar cheese, lettuce, tomato, and our special sauce.',
    ),
    FoodItemModel(
      name: 'Bacon Deluxe Burger',
      imagePath: 'assets/images/food_41.jpeg',
      rating: 4.9,
      price: 18.750,
      category: 'Burger',
      description:
          'Double beef patty with crispy bacon, cheddar cheese, and BBQ sauce.',
    ),
    FoodItemModel(
      name: 'Spicy BBQ Burger',
      imagePath: 'assets/images/food_42.jpeg',
      rating: 4.7,
      price: 16.500,
      category: 'Burger',
      description:
          'Spicy beef patty with BBQ sauce, jalapeños, and crispy onions.',
    ),
    FoodItemModel(
      name: 'Mushroom Swiss Burger',
      imagePath: 'assets/images/food_43.jpeg',
      rating: 4.6,
      price: 17.890,
      category: 'Burger',
      description: 'Beef patty topped with sautéed mushrooms and Swiss cheese.',
    ),
    FoodItemModel(
      name: 'Veggie Burger',
      imagePath: 'assets/images/food_44.jpeg',
      rating: 4.5,
      price: 14.990,
      category: 'Burger',
      description: 'Plant-based patty with fresh veggies and avocado.',
    ),
    FoodItemModel(
      name: 'Double Stack Burger',
      imagePath: 'assets/images/food_45.jpeg',
      rating: 4.9,
      price: 19.250,
      category: 'Burger',
      description: 'Two beef patties with double cheese and bacon.',
    ),
// Sweets
    FoodItemModel(
      name: 'Berry cake ',
      imagePath: 'assets/images/food_19.png',
      rating: 4.7,
      price: 12.490,
      category: 'Sweet',
      description: 'A round, frosted cake topped with fresh blackberries.',
    ),
    FoodItemModel(
      name: 'Cheesecake Slice',
      imagePath: 'assets/images/food_20.png',
      rating: 4.8,
      price: 13.750,
      category: 'Sweet',
      description:
          'A creamy cheesecake topped with a vibrant fruit layer and edible flowers',
    ),
    FoodItemModel(
      name: 'Meringue Dessert',
      imagePath: 'assets/images/food_10.png',
      rating: 4.6,
      price: 14.290,
      category: 'Sweet',
      description:
          'A light dessert with crisp meringue, ice cream, and sweet fruit accents.',
    ),
    FoodItemModel(
      name: 'Panna Cotta',
      imagePath: 'assets/images/food_11.png',
      rating: 4.9,
      price: 15.990,
      category: 'Sweet',
      description:
          'Creamy panna cotta served in jars with fresh strawberry topping.',
    ),
    FoodItemModel(
      name: 'Ice Cream Sundae',
      imagePath: 'assets/images/food_12.png',
      rating: 4.5,
      price: 11.990,
      category: 'Sweet',
      description:
          'A bowl of ice cream scoops with colorful sprinkles in an edible sprinkle-coated bowl.',
    ),
    FoodItemModel(
      name: 'Cupcake and Meringues',
      imagePath: 'assets/images/food_17.png',
      rating: 4.8,
      price: 13.490,
      category: 'Sweet',
      description:
          ' A cupcake topped with pink frosting and a cherry, alongside meringue shapes on a baking tray.',
    ),

// Pizzas
    FoodItemModel(
      name: 'Margherita Pizza',
      imagePath: 'assets/images/food_55.jpeg',
      rating: 4.7,
      price: 22.500,
      category: 'Pizza',
      description: 'Classic pizza with fresh tomatoes, mozzarella, and basil.',
    ),
    FoodItemModel(
      name: 'Pepperoni Pizza',
      imagePath: 'assets/images/food_56.jpeg',
      rating: 4.9,
      price: 24.990,
      category: 'Pizza',
      description: 'Loaded with pepperoni and extra cheese.',
    ),
    FoodItemModel(
      name: 'Veggie Supreme Pizza',
      imagePath: 'assets/images/food_57.jpeg',
      rating: 4.6,
      price: 21.750,
      category: 'Pizza',
      description: 'Topped with bell peppers, onions, and mushrooms.',
    ),
    FoodItemModel(
      name: 'Meat Lover’s Pizza',
      imagePath: 'assets/images/food_58.jpeg',
      rating: 4.8,
      price: 26.490,
      category: 'Pizza',
      description: 'Packed with sausage, pepperoni, and bacon.',
    ),
    FoodItemModel(
      name: 'Hawaiian Pizza',
      imagePath: 'assets/images/food_59.jpeg',
      rating: 4.5,
      price: 23.290,
      category: 'Pizza',
      description: 'Ham and pineapple with mozzarella cheese.',
    ),
    FoodItemModel(
      name: 'BBQ Chicken Pizza',
      imagePath: 'assets/images/food_60.jpeg',
      rating: 4.7,
      price: 24.500,
      category: 'Pizza',
      description: 'Grilled chicken with BBQ sauce and red onions.',
    ),
// Drinks
    FoodItemModel(
      name: 'Cola Classic',
      imagePath: 'assets/images/food_61.jpeg',
      rating: 4.6,
      price: 3.990,
      category: 'Drink',
      description: 'Refreshing classic cola served ice-cold.',
    ),
    FoodItemModel(
      name: 'Lemon Iced Tea',
      imagePath: 'assets/images/food_50.jpeg',
      rating: 4.7,
      price: 4.490,
      category: 'Drink',
      description: 'Freshly brewed iced tea with a hint of lemon.',
    ),
    FoodItemModel(
      name: 'Mango Smoothie',
      imagePath: 'assets/images/food_51.jpeg',
      rating: 4.8,
      price: 5.990,
      category: 'Drink',
      description: 'Creamy mango smoothie blended with yogurt.',
    ),
    FoodItemModel(
      name: 'Sparkling Water',
      imagePath: 'assets/images/food_52.jpeg',
      rating: 4.5,
      price: 3.750,
      category: 'Drink',
      description: 'Crisp and refreshing sparkling water.',
    ),
    FoodItemModel(
      name: 'Strawberry Milkshake',
      imagePath: 'assets/images/food_53.jpeg',
      rating: 4.9,
      price: 6.490,
      category: 'Drink',
      description: 'Rich and creamy strawberry milkshake.',
    ),
    FoodItemModel(
      name: 'Espresso',
      imagePath: 'assets/images/food_54.jpeg',
      rating: 4.7,
      price: 4.990,
      category: 'Drink',
      description: 'Bold and aromatic espresso shot.',
    ),
  ];

  int _selectedIndex = 0;
  String _selectedCategory = 'Pizza';

  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FoodHomeScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OrderScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChatScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        title: const Text(
          'Food Menu',
          style: TextStyle(color: Colors.black, fontSize: 36),
        ),
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationsPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderBanner(),
            _buildCategorySection(),
            _buildCategoryIcons(context),
            _buildFoodGrid(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeaderBanner() {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.76,
          image: AssetImage('assets/images/food_32.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: Text(
          'Provide the best food for you',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Find by Category',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryIcons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCategoryButton(context, 'Burger', Icons.fastfood),
          _buildCategoryButton(context, 'Sweet', Icons.cake),
          _buildCategoryButton(context, 'Drink', Icons.local_drink),
          _buildCategoryButton(context, 'Pizza', Icons.local_pizza),
        ],
      ),
    );
  }

  Widget _buildFoodGrid(BuildContext context) {
    final filteredFoodItems =
        foodItems.where((food) => food.category == _selectedCategory).toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: filteredFoodItems.length,
        itemBuilder: (context, index) {
          final food = filteredFoodItems[index];
          return _buildFoodItem(context, food);
        },
      ),
    );
  }

  Widget _buildCategoryButton(
      BuildContext context, String label, IconData icon) {
    final isSelected = _selectedCategory == label;
    return GestureDetector(
      onTap: () => _onCategorySelected(label),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected ? Colors.orange : Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.orange : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem(BuildContext context, FoodItemModel food) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailScreen(food: food),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.asset(
                    food.imagePath,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                /* Positioned(
                  top: 2,
                  right: 2,
                  child: IconButton(
                    icon: const Icon(Icons.favorite_border, color: Colors.red),
                    onPressed: () {},
                  ),
                ),*/
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 4),
                      Text('${food.rating}'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${food.price.toStringAsFixed(3)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), label: 'My order'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
