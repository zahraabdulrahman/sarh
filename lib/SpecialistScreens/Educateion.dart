import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sarh/SpecialistScreens/editVideos.dart';
import 'package:sarh/SpecialistScreens/recordVideos.dart';

import '../reusable_widgets/reusable_widget.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _Education();
}

class _Education extends State<Education> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //extendBodyBehindAppBar: true, // <-- Set this
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
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                child: Transform(
                  transform: Matrix4.translationValues(296, -8, 0),
                  child: const Text("الدروس"),
                ),
              ),
            ],
          ),


          const Divider(color: Color.fromARGB(255, 216, 188, 128)),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buttons2(
                      context,
                      60.0,
                      250.0,
                      9.0,
                      1.0,
                      20.0,
                      15.0,
                      "رفع درس",
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const recordVideos()),
                            );
                      },
                      const Color(0xFFFFD972),
                      const Color(0xFF99CFA5),
                    ),
                    const SizedBox(height: 40,),
                    buttons2(
                      context,
                      60.0,
                      250.0,
                      9.0,
                      1.0,
                      20.0,
                      15.0,
                      "تعديل درس",
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const editVideos()),
                            );
                      },
                      const Color(0xFFEFA7A7),
                      const Color(0xFF99CFA5),
                    ),
                  ],
                ),
            ),
          ),
        ],
      ),
    );
  }
}
