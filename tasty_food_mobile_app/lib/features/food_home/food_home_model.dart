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
