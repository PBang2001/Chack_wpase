import 'package:flutter/material.dart';
import 'LoginPage/Loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wpace',
      theme: ThemeData.dark(),
      home: const LoginPage(),
    );
  }
}
