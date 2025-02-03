import 'package:flutter/material.dart';
import 'login_page.dart'; // Import the LoginPage

class HomePageForDriver extends StatelessWidget {
  final TextEditingController _busCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFcad2c5), // Light Grayish
              Color(0xFFa7bea9), // Soft Green
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Enter Bus Code',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF52796f), // Muted Green
                    ),
                  ),
                  SizedBox(height: 40.0),
                  TextField(
                    controller: _busCodeController,
                    keyboardType: TextInputType.text, // Allows letters & numbers
                    textCapitalization: TextCapitalization.characters, // Auto uppercase
                    decoration: InputDecoration(
                      hintText: 'Enter Bus Code',
                      hintStyle: TextStyle(color: Color(0xFF84a98c)), // Light Greenish hint
                      filled: true,
                      fillColor: Color(0xFF2f3e46), // Dark Slate background
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Check if bus code is entered
                      if (_busCodeController.text.isEmpty) {
                        // Display an error message if the bus code is empty
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter a Bus Code.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        // Navigate to the login page if bus code is entered
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(busCode: _busCodeController.text),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFa7bea9), // Soft Green
                      foregroundColor: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 12.0),
                      elevation: 4,
                    ),
                    child: Text(
                      'Go to Login',
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
