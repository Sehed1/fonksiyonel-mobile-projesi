class FoodItem {
  String name;
  double price;
  String imageUrl;
  String deliveryInfo;
  String deliveryTime;
  double rating;
  String description;
  int quantity;

  FoodItem({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.deliveryInfo,
    required this.deliveryTime,
    required this.rating,
    required this.description,
    this.quantity = 1,
  });
}
