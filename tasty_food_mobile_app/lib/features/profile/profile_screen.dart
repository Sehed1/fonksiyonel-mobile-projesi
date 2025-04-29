import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<List<Map<String, dynamic>>> loadUserData() async {
    try {
      final String response = await rootBundle.loadString('assets/users.json');
      final data = jsonDecode(response);
      return List<Map<String, dynamic>>.from(data['users']);
    } catch (e) {
      throw Exception("Error loading JSON data: $e");
    }
  }

  Future<bool> validateUser(String username, String password) async {
    final users = await loadUserData();
    final user = users.firstWhere(
      (user) => user['username'] == username && user['password'] == password,
      orElse: () => {},
    );
    return user.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        title: const Text(
          'Profile ',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: loadUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            final userData = users.isNotEmpty ? users[0] : null;
            final username = userData?['username'] ?? "Unknown User";
            final email = userData?['email'] ?? "No Email Available";
            final phone = userData?['phone'] ?? "No Phone Available";

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        "Hello $username",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Email: $email',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Phone: $phone',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
