import 'package:flutter/material.dart';
import 'login_page.dart'; // Import the LoginPage

class HomePageForDriver extends StatefulWidget {
  @override
  _HomePageForDriverState createState() => _HomePageForDriverState();
}

class _HomePageForDriverState extends State<HomePageForDriver> {
  final TextEditingController _busCodeController = TextEditingController();
  bool _isBusCodeError = false;

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.85; // 85% of screen width

    return Scaffold(
      extendBodyBehindAppBar: true, // Removes the top bar
      backgroundColor: Colors.transparent, // Transparent background
      body: Stack(
        children: [
          // Animated tech background (same as login page)
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
                color: Color(0xFF1E1E2E), // Dark Purple
                child: Container(
                  width: cardWidth,
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Enter Bus Code',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        controller: _busCodeController,
                        decoration: InputDecoration(
                          hintText: 'Enter Bus Code',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Color(0xFF2A2A3E), // Darker Purple
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.directions_bus,
                            color: Colors.white,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      // Show error message if bus code is empty
                      if (_isBusCodeError)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Text(
                            'Please enter a bus code.',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          if (_busCodeController.text.isEmpty) {
                            setState(() {
                              _isBusCodeError = true;
                            });
                          } else {
                            setState(() {
                              _isBusCodeError = false;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    LoginPage(busCode: _busCodeController.text),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF7F56D9), // Purple
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 12.0),
                        ),
                        child: Text('Go to Login'),
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
