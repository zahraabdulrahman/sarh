import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:sarh/User_Screens/Cards.dart';
import 'Game.dart';
import 'Sarh.dart';
import 'consultations.dart';
import 'User_Settings.dart';
import 'DatesPage.dart';


class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  GlobalKey<CurvedNavigationBarState>_curvednavigationkey=GlobalKey();
  int _currentPage = 0;
  final List<Widget> _pages = [
    Sarh(),
    DatesPage(),
    Cards(),
    Game(),
    User_Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _curvednavigationkey,
        index: 0,
        height: 50.0,
        items: const [
          SizedBox(
            height: 35,
            child: Column(
              children: [
                Icon(Icons.home, size: 24, color: Colors.black),
                Text(
                  "صرح",
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
          SizedBox(
            height: 35,
            child: Column(
              children: [
                Icon(Icons.date_range, size: 24, color: Colors.black),
                Text(
                  "المواعيد",
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
          SizedBox(
            height: 35,
            child: Column(
              children: [
                Icon(Icons.chat, size: 24, color: Colors.black),
                Text(
                  "بطاقات",
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
          SizedBox(
            height: 35,
            child: Column(
              children: [
                Icon(Icons.voice_chat, size: 24, color: Colors.black),
                Text(
                  "اللعب",
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
          SizedBox(
            height: 35,
            child: Column(
              children: [
                Icon(Icons.more_horiz, size: 24, color: Colors.black),
                Text(
                  "المزيد",
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
        ],
        backgroundColor: Colors.white,
        color: const Color.fromARGB(255, 167, 232, 189),
        buttonBackgroundColor: const Color.fromARGB(255, 167, 232, 189),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          if (index >= 0 && index < _pages.length) {
            setState(() {
              _currentPage = index;
            });
          } else {
            print("Invalid navigation index: $index");
          }
        },
        letIndexChange: (index)=>true,
      ),
      body: _pages[_currentPage],
    );
  }
}
