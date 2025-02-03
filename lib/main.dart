import 'package:flutter/material.dart';
import 'role_selection_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Operator Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFFcad2c5), // Light Grayish background
        cardColor: Color(0xFF84a98c), // Light Greenish for cards
        primaryColor: Color(0xFF52796f), // Muted Green
        colorScheme: ColorScheme.dark().copyWith(
          primary: Color(0xFF52796f),
          secondary: Color(0xFF354f52),
        ),
      ),
      home: RoleSelectionPage(), // Updated to start with role selection
    );
  }
}
