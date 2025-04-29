import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
        title: const Text('Register'),
        backgroundColor: const Color(0xFFFF8300),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Text
            const Text(
              'Create a new account',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Please create new account',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 40),

            // Full Name TextField
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Full name',
                hintText: 'Enter your full name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Email TextField
            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Password TextField
            TextField(
              controller: passCtrl,
              obscureText: _obscurePass,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePass ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: _togglePass,
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Register Button
            ElevatedButton(
              onPressed: () {
                // Handle the register logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF8300), // Orange color
                padding: const EdgeInsets.symmetric(vertical: 15),
                minimumSize:
                    const Size(double.infinity, 50), // Full-width button
              ),
              child: const Text(
                'Register',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Login Link
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  // Add navigation to login screen here
                },
                child: const Text(
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
