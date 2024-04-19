import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sarh/SpecialistScreens/Educateion.dart';
import 'package:sarh/SpecialistScreens/Speciality_settings.dart';

import 'Account.dart';
import 'Sarh.dart';
import 'Specialist_dates.dart';

class Specialist_navigation extends StatefulWidget {
  const Specialist_navigation({super.key});

  @override
  State<Specialist_navigation> createState() => _Specialist_navigationState();
}

class _Specialist_navigationState extends State<Specialist_navigation> {
  final GlobalKey<CurvedNavigationBarState>_curvednavigationkey=GlobalKey();
   int _currentPage = 0;
  final List<Widget> _pages = [
    // Replace Page1, Page2, etc. with your actual page widgets
    const Sarh(),
    const Specialist_dates(),
    const Education(),
    const Account(),
    const Speciality_settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
                  Icon(Icons.calendar_month, size: 24, color: Colors.black),
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
                  Icon(Icons.videocam, size: 24, color: Colors.black),
                  Text(
                    "تعليم",
                    style: TextStyle(fontSize: 8, fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 35,
              child: Column(
                children: [
                  Icon(Icons.person, size: 24, color: Colors.black),
                  Text(
                    "الحساب",
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
      ),
    );
  }
}
