import 'package:flutter/material.dart';
import 'driver_dashboard.dart'; // Import the DriverDashboard

class LoginPage extends StatefulWidget {
  final String busCode;

  LoginPage({required this.busCode});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _driverIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isDriverIdError = false;
  bool _isPasswordError = false;
  bool _isPasswordVisible = false;

  void _validateAndLogin() {
    setState(() {
      // Reset errors when user starts typing
      if (_driverIdController.text.isNotEmpty) {
        _isDriverIdError = false;
      }
      if (_passwordController.text.isNotEmpty) {
        _isPasswordError = false;
      }

      // Show error if fields are empty
      if (_driverIdController.text.isEmpty && _passwordController.text.isEmpty) {
        _isDriverIdError = true;
        _isPasswordError = true;
      } else if (_driverIdController.text.isEmpty) {
        _isDriverIdError = true;
      } else if (_passwordController.text.isEmpty) {
        _isPasswordError = true;
      } else {
        // Both fields are filled, proceed with login
        _isDriverIdError = false;
        _isPasswordError = false;

        // Navigate to DriverDashboard after successful validation
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DriverDashboard(busCode: widget.busCode),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 5),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue[900]!, Colors.indigo[900]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                color: Color(0xFF1E1E2E),
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
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Bus Code: ${widget.busCode.toUpperCase()}',
                        style: TextStyle(fontSize: 20.0, color: Colors.white70),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        controller: _driverIdController,
                        decoration: InputDecoration(
                          hintText: 'Driver ID',
                          filled: true,
                          fillColor: Color(0xFF2A2A3E),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        onChanged: (_) => setState(() {
                          if (_driverIdController.text.isNotEmpty) {
                            _isDriverIdError = false;
                          }
                        }),
                      ),
                      if (_isDriverIdError)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Text(
                            'Please enter your Driver ID.',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      SizedBox(height: 16.0),
                      TextField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          filled: true,
                          fillColor: Color(0xFF2A2A3E),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        onChanged: (_) => setState(() {
                          if (_passwordController.text.isNotEmpty) {
                            _isPasswordError = false;
                          }
                        }),
                      ),
                      if (_isPasswordError)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Text(
                            'Please enter your password.',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: _validateAndLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF7F56D9),
                          foregroundColor: Colors.white,
                        ),
                        child: Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}