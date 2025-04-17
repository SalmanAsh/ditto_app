import 'package:flutter/material.dart';
import 'intro_screens.dart';

void main() {
  // Make the root of the tree runApp( root )
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

