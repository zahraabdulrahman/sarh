import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sarh/Screens/SplashScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const SplashScreen(),
    },
  ));
}
