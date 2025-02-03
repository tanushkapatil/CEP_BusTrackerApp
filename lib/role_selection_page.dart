import 'package:flutter/material.dart';
import 'home_page_for_driver.dart'; // Renamed HomePage

class RoleSelectionPage extends StatelessWidget {
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
                    'Select Your Role',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF52796f), // Muted Green
                    ),
                  ),
                  SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePageForDriver()),
                      );
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
                    child: Text('Bus Driver', style: TextStyle(fontSize: 18.0)),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to user page (to be implemented)
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF52796f), // Muted Green
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 12.0),
                      elevation: 4,
                    ),
                    child: Text('User', style: TextStyle(fontSize: 18.0)),
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
