import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Shortened controllers for text fields
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  bool _obscurePass = true;

  // Toggle password visibility
  void _togglePass() {
    setState(() {
      _obscurePass = !_obscurePass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Color(0xFFFF8300),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Text
            Text(
              'Create a new account',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Please create new account',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 40),

            // Full Name TextField
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                labelText: 'Full name',
                hintText: 'Enter your full name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Email TextField
            TextField(
              controller: emailCtrl,
              decoration: InputDecoration(
                labelText: 'Email Address',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Password TextField
            TextField(
              controller: passCtrl,
              obscureText: _obscurePass,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePass ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: _togglePass,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Register Button
            ElevatedButton(
              onPressed: () {
                // Handle the register logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF8300), // Orange color
                padding: EdgeInsets.symmetric(vertical: 15),
                minimumSize: Size(double.infinity, 50), // Full-width button
              ),
              child: Text(
                'Register',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Login Link
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  // Add navigation to login screen here
                },
                child: Text(
                  "Have account? Login",
                  style: TextStyle(color: Color(0xFFFF8300)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
