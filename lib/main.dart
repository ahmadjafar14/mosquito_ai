import 'package:flutter/material.dart';
import 'package:smart_mosquito_cam/views/splash.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Mosquito Cam',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // pastikan ini benar
    );
  }
}
