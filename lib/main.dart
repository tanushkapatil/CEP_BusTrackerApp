import 'package:flutter/material.dart';
import 'role_selection_page.dart'; // New role selection page

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
        scaffoldBackgroundColor: Color(0xFF090909), // Dark Black
        cardColor: Color(0xFF1E1E2E), // Dark Purple
        primaryColor: Color(0xFF7F56D9), // Purple
        colorScheme: ColorScheme.dark().copyWith(
          primary: Color(0xFF7F56D9), // Purple
          secondary: Color(0xFF9A6AFF), // Light Purple
        ),
      ),
      home: SelectRolePage(),
    );
  }
}
