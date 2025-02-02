import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String busCode;

  LoginPage({required this.busCode});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _driverIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFcad2c5), // Light Sage background
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Driver Login',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF52796f), // Deep Green
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Bus Code: ${widget.busCode}',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFF52796f), // Deep Green
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: _driverIdController,
                    decoration: InputDecoration(
                      hintText: 'Driver ID',
                      hintStyle: TextStyle(color: Color(0xFF84a98c)), // Muted Green hint
                      labelStyle: TextStyle(color: Color(0xFF52796f)), // Deep Green label
                      prefixIcon: Icon(Icons.person, color: Color(0xFF52796f)),
                      filled: true,
                      fillColor: Color(0xFF2f3e46), // Dark Slate for background
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Color(0xFF84a98c)), // Muted Green hint
                      labelStyle: TextStyle(color: Color(0xFF52796f)), // Deep Green label
                      prefixIcon: Icon(Icons.lock, color: Color(0xFF52796f)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Color(0xFF52796f),
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: Color(0xFF2f3e46), // Dark Slate for background
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Add your login logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFa7bea9), // Soft Green
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 12.0),
                      elevation: 4,
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
