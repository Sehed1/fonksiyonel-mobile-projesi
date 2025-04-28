import 'package:flutter/material.dart';

class CategoryButtons extends StatefulWidget {
  final String initialCategory;
  final Function(String) onCategorySelected;

  const CategoryButtons({
    super.key,
    required this.initialCategory,
    required this.onCategorySelected,
  });

  @override
  _CategoryButtonsState createState() => _CategoryButtonsState();
}

class _CategoryButtonsState extends State<CategoryButtons> {
  late String _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.initialCategory;
  }

  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
    });
    widget.onCategorySelected(category);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCategoryButton(context, 'Burger', Icons.fastfood),
          _buildCategoryButton(context, 'Taco', Icons.food_bank),
          _buildCategoryButton(context, 'Drink', Icons.local_drink),
          _buildCategoryButton(context, 'Pizza', Icons.local_pizza),
        ],
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
}
