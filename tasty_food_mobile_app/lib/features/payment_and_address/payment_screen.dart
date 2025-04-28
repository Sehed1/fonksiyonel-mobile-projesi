import 'package:flutter/material.dart';
import 'package:tasty_food_mobile_app/features/home_screen/home_screen.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment And Address"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
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
                Text("You deserve better meal",
                    style: TextStyle(color: Colors.grey)),
                SizedBox(height: 20),
                Text("Item Ordered",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ListTile(
                  leading: Image.asset('assets/images/food_30.png'),
                  title: Text("Burger With Meat",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("14 items"),
                  trailing: Text("\$ 12,230",
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20),
                Text("Details Transaction",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                _buildTransactionRow("Cherry Healthy", "\$ 180.000"),
                _buildTransactionRow("Driver", "\$ 50.000"),
                _buildTransactionRow("Tax 10%", "\$ 80.390"),
                _buildTransactionRow("Total Price", "\$ 100.000",
                    isTotal: true),
                Divider(height: 40),
                Text("Deliver to :",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                _buildDeliveryInfo("Name", "Albert Stevano"),
                _buildDeliveryInfo("Phone No.", "+12 8347 2838 28"),
                _buildDeliveryInfo("Address", "New York"),
                _buildDeliveryInfo("House No.", "BC54 Berlin"),
                _buildDeliveryInfo("City", "New York City"),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Checkout process started")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    ),
                    child: Text("Checkout Now",
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
          Text(label, style: TextStyle(color: Colors.grey)),
          Text(info, style: TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
