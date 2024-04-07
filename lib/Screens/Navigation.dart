import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:sarh/Screens/SecondRoute.dart';
import 'cameraPage.dart';
import 'Sarh.dart';
import 'consultations.dart';
import 'homePage.dart';
import 'DatesPage.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl, // Set text direction to RTL
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavigationBar(),
      ),
    );
  }
}

class NavigationBar extends StatefulWidget {
  const NavigationBar({super.key});

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  final PageController _pageController = PageController(initialPage: 5); // Start with the last page (index 2)

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Disable gesture scrolling
        children: const <Widget>[
          HomePage(),
          CameraPage(),
          Consulations(),
          DatesPage(),
          Sarh(),
          SecondRoute(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        buttonBackgroundColor: const Color.fromARGB(255, 167, 232, 189),
        color: const Color.fromARGB(255, 167, 232, 189),
        height: 65,
        items: const <Widget>[
          SizedBox(
            height: 41,
            child: Column(
              children: [
                Icon(Icons.more_horiz, size: 30, color: Colors.black),
                Text(
                  "المزيد",
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
          SizedBox(
            height: 41,
            child: Column(
              children: [
                Icon(Icons.voice_chat, size: 30, color: Colors.black),
                Text(
                  "اللعب",
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
          SizedBox(
            height: 41,
            child: Column(
              children: [
                Icon(Icons.chat, size: 30, color: Colors.black),
                Text(
                  "بطاقات",
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
          SizedBox(
            height: 41,
            child: Column(
              children: [
                Icon(Icons.date_range, size: 30, color: Colors.black),
                Text(
                  "المواعيد",
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
          SizedBox(
            height: 41,
            child: Column(
              children: [
                Icon(Icons.home, size: 30, color: Colors.black),
                Text(
                  "صرح",
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
        ],
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);
        },
      ),
    );
  }
}
