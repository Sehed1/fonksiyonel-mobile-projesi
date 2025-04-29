// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Notifications'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.local_offer, color: Colors.orange),
              title: Text('Limited Time Offer!'),
              subtitle: Text('Get 20% off on all burgers today.'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.local_offer, color: Colors.orange),
              title: Text('Free Delivery!'),
              subtitle: Text('Enjoy free delivery on orders over \$30.'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.local_offer, color: Colors.orange),
              title: Text('Buy 1 Get 1 Free!'),
              subtitle: Text('Order any drink and get another for free.'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.local_offer, color: Colors.orange),
              title: Text('Weekend Special!'),
              subtitle: Text('Special discounts on all pizza categories.'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.local_cafe, color: Colors.orange),
              title: Text('New Drinks Available!'),
              subtitle:
                  Text('Try our new refreshing smoothies and cold brews.'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.local_pizza, color: Colors.orange),
              title: Text('Pizza Lovers Discount!'),
              subtitle: Text('Order 2 large pizzas and get 30% off.'),
            ),
          ),
        ],
      ),
    );
  }
}
