import 'package:flutter/material.dart';

class bookSession extends StatefulWidget {
  const bookSession({super.key});

  @override
  State<bookSession> createState() => _bookSessionState();
}

class _bookSessionState extends State<bookSession> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'جلسات مجدولة',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/صرح.png'),
                  fit: BoxFit.fill)),
        ),
        toolbarHeight: 250,
      ),
      body: const Column(
        children: [

        ],
      ),
    );
  }
}
