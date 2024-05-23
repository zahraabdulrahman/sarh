import 'package:flutter/material.dart';

class editVideos extends StatefulWidget {
  const editVideos({super.key});

  @override
  State<editVideos> createState() => _editVideosState();
}

class _editVideosState extends State<editVideos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'تعليم',
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Education.png'),
                  fit: BoxFit.fill)),
        ),
        toolbarHeight: 250,
      ),
    );
  }
}
