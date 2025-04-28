import 'package:flutter/material.dart';

// Cart Item Model
class CartItem {
  String name;
  double price;
  int quantity;
  bool isSelected;

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 1,
    this.isSelected = true,
  });
}

// Consolidated Cart Screen
class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  List<CartItem> cartItems = [
    CartItem(name: 'Burger With Meat', price: 12230.0),
    CartItem(name: 'Burger With Meat', price: 12230.0),
  ];

  String promoCode = '';
  double discount = 0.0;
  final double defaultDiscount = 10900.0;
  final String validPromoCode = 'SAVE10';
  final double deliveryFee = 0.0;

  double get subtotal {
    return cartItems.fold(
        0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  double get total {
    return subtotal + deliveryFee - discount;
  }

  int get totalItems {
    return cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  void applyPromoCode(String code) {
    setState(() {
      promoCode = code;
      if (code == validPromoCode) {
        discount = defaultDiscount;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Promo code applied! Discount: \$${discount.toStringAsFixed(0)}')),
        );
      } else {
        discount = 0.0;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid promo code')),
        );
      }
    });
  }

  void deleteItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void placeOrder() {
    if (cartItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Your cart is empty!')),
      );
      return;
    }

    setState(() {
      cartItems.clear();
      discount = 0.0;
      promoCode = '';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Order placed successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('More Options'),
                  content: Text('Additional actions can be added here.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        promoCode = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Promo Code...',
                        prefixIcon:
                            Icon(Icons.local_offer, color: Colors.orange),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      applyPromoCode(promoCode);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    child: Text(
                      'Apply',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              if (cartItems.isEmpty) Center(child: Text('Your cart is empty')),
              ...cartItems.asMap().entries.map((entry) {
                int index = entry.key;
                CartItem item = entry.value;
                return Column(
                  children: [
                    _buildCartItem(
                      name: item.name,
                      price: '\$${item.price.toStringAsFixed(0)}',
                      quantity: item.quantity,
                      isSelected: item.isSelected,
                      onToggleSelect: (value) {
                        setState(() {
                          item.isSelected = value!;
                        });
                      },
                      onDecrease: () {
                        setState(() {
                          if (item.quantity > 1) {
                            item.quantity--;
                          }
                        });
                      },
                      onIncrease: () {
                        setState(() {
                          item.quantity++;
                        });
                      },
                      onDelete: () {
                        deleteItem(index);
                      },
                    ),
                    SizedBox(height: 16),
                  ],
                );
              }).toList(),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PAYMENT SUMMARY',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16),
                      _buildSummaryRow('TOTAL ITEMS (${totalItems})',
                          '\$${subtotal.toStringAsFixed(0)}'),
                      SizedBox(height: 8),
                      _buildSummaryRow(
                          'DELIVERY FEE',
                          deliveryFee == 0
                              ? 'Free'
                              : '\$${deliveryFee.toStringAsFixed(0)}',
                          valueColor: Colors.green),
                      SizedBox(height: 8),
                      _buildSummaryRow(
                          'DISCOUNT', '-\$${discount.toStringAsFixed(0)}',
                          valueColor: Colors.red),
                      Divider(),
                      _buildSummaryRow('TOTAL', '\$${total.toStringAsFixed(0)}',
                          isTotal: true),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: placeOrder,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    'Order Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem({
    required String name,
    required String price,
    required int quantity,
    required bool isSelected,
    required ValueChanged<bool?> onToggleSelect,
    required VoidCallback onDecrease,
    required VoidCallback onIncrease,
    required VoidCallback onDelete,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Checkbox(
              value: isSelected,
              onChanged: onToggleSelect,
              activeColor: Colors.orange,
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text('Image')),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: onDecrease,
                ),
                Text('$quantity'),
                IconButton(
                  icon: Icon(Icons.add_circle_outline),
                  onPressed: onIncrease,
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value,
      {Color? valueColor, bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            fontSize: isTotal ? 16 : 14,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            fontSize: isTotal ? 16 : 14,
            color: valueColor ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
