import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sarh/Screens/SecondRoute.dart';
import 'cameraPage.dart';
import 'Sarh.dart';
import 'homePage.dart';
import 'profilePage.dart';
import 'DatesPage.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<Navigation> {
   final _pageController = PageController();
    @override
  void dispose() {
    _pageController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //appBar: AppBar(
          //centerTitle: true,
          //title: const Text('Curved Navigation Bar'),
          //backgroundColor: const Color.fromARGB(255, 255, 240, 219),
          //foregroundColor: Colors.black,
       // ),
        body: PageView(
          controller: _pageController,
          children: const <Widget>[
            HomePage(),
            CameraPage(),
            ProfilePage(),
            DatesPage(),
            Sarh(),
            SecondRoute()
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          buttonBackgroundColor: const Color.fromARGB(255,167,232,189),
          color: const Color.fromARGB(255,167,232,189),
          height: 65,
          items:  const <Widget>[
            SizedBox(
              height: 41,
              child: Column(
                children: [
                  Icon(Icons.more_horiz, size: 30, color: Color.fromRGBO(0, 0, 0, 1)),
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
                  Icon(Icons.voice_chat, size: 30, color: Color.fromRGBO(0, 0, 0, 1)),
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
                  Icon(Icons.chat, size: 30, color: Color.fromRGBO(0, 0, 0, 1)),
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
                  Icon(Icons.date_range, size: 30, color: Color.fromRGBO(0, 0, 0, 1)),
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
                  Icon(Icons.home, size: 30, color: Color.fromRGBO(0, 0, 0, 1)),
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
      ),
    );
  }
}