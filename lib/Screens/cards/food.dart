import 'package:flutter/material.dart';
class Food extends StatelessWidget {
  const Food({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Transform(
          transform: Matrix4.translationValues(150, 43, 0.0),
          child: const Text(
            'بطاقات',
            style: TextStyle(color: Colors.black, fontSize: 28),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/صرح.png'),
                  fit: BoxFit.fill)),
        ),
        toolbarHeight: 250,
      ),
    );
  }}