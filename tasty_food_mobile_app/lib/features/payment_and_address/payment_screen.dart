import 'package:flutter/material.dart';
import 'package:tasty_food_mobile_app/features/home_screen/home_screen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment And Address"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("You deserve better meal",
                    style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 20),
                const Text("Item Ordered",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ListTile(
                  leading: Image.asset('assets/images/food_30.png'),
                  title: const Text("Burger With Meat",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text("14 items"),
                  trailing: const Text("\$ 12,230",
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                const Text("Details Transaction",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                _buildTransactionRow("Cherry Healthy", "\$ 180.000"),
                _buildTransactionRow("Driver", "\$ 50.000"),
                _buildTransactionRow("Tax 10%", "\$ 80.390"),
                _buildTransactionRow("Total Price", "\$ 100.000",
                    isTotal: true),
                const Divider(height: 40),
                const Text("Deliver to :",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                _buildDeliveryInfo("Name", "Albert Stevano"),
                _buildDeliveryInfo("Phone No.", "+12 8347 2838 28"),
                _buildDeliveryInfo("Address", "New York"),
                _buildDeliveryInfo("House No.", "BC54 Berlin"),
                _buildDeliveryInfo("City", "New York City"),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Checkout process started")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 15),
                    ),
                    child: const Text("Checkout Now",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionRow(String title, String amount,
      {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  color: isTotal ? Colors.black : Colors.grey,
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text(amount,
              style: TextStyle(
                  color: isTotal ? Colors.orange : Colors.grey,
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  Widget _buildDeliveryInfo(String label, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(info, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
