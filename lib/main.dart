import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(BeautyStoreApp());
}

class BeautyStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beauty Store UI',
      theme: ThemeData(primarySwatch: Colors.pink, fontFamily: 'Cairo'),
      home: SplashScreen(),
    );
  }
}
