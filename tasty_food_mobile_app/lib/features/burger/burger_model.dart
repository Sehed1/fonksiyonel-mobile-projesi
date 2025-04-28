class ItemModel {
  final String image;
  final String price;
  final String rating;
  final String title;

  const ItemModel({
    required this.image,
    required this.price,
    required this.rating,
    required this.title,
  });
}

class BurgerModel {
  static const List<ItemModel> items = [
    ItemModel(
      image: 'assets/images/food_1.png',
      price: '20.99',
      rating: '4.8',
      title: ' Burger',
    ),
    ItemModel(
      image: 'assets/images/food_2.png',
      price: '10.50',
      rating: '4.5',
      title: 'Cheese Delight',
    ),
    ItemModel(
      image: 'assets/images/food_3.png',
      price: '14.75',
      rating: '4.9',
      title: 'Meat Lover',
    ),
    ItemModel(
      image: 'assets/images/food_4.png',
      price: '9.99',
      rating: '4.2',
      title: 'Veggie Taco',
    ),
    ItemModel(
      image: 'assets/images/food_5.png',
      price: '11.25',
      rating: '4.6',
      title: 'Grilled Chicken',
    ),
    ItemModel(
      image: 'assets/images/food_6.png',
      price: '13.40',
      rating: '4.7',
      title: 'Double Cheese',
    ),
    ItemModel(
      image: 'assets/images/food_7.png',
      price: '15.00',
      rating: '5.0',
      title: 'Premium Steak Burger',
    ),
    ItemModel(
      image: 'assets/images/food_8.png',
      price: '8.75',
      rating: '4.3',
      title: 'Crispy Fries Combo',
    ),
    ItemModel(
      image: 'assets/images/food_9.png',
      price: '12.00',
      rating: '4.4',
      title: 'Spicy Special',
    ),
  ];
}
