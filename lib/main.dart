import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Driver Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFFcad2c5), // Light Grayish color for the background
        cardColor: Color(0xFF84a98c), // Light Greenish for the cards
        primaryColor: Color(0xFF52796f), // Muted Green
        colorScheme: ColorScheme.dark().copyWith(
          primary: Color(0xFF52796f), // Green for primary
          secondary: Color(0xFF354f52), // Darker greenish blue for secondary
        ),
      ),
      home: HomePage(),
    );
  }
}
