import 'package:flutter/material.dart';
import 'package:sarh/Screens/SplashScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const SplashScreen(),
    },
  ));
}

