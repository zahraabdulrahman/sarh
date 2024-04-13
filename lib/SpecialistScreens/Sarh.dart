import 'package:flutter/material.dart';
import 'package:sarh/User_Screens/consultations.dart';
//import 'package:flutter/src/rendering/box.dart';
// import 'consultations.dart';
// import 'SessionsPage.dart';

class Sarh extends StatefulWidget {
  const Sarh({super.key});

  @override
  State<Sarh> createState() => _Sarh();
}

class _Sarh extends State<Sarh> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        //extendBodyBehindAppBar: true, // <-- Set this
        appBar: AppBar(
          title: SizedBox(
            child: Transform(
              transform: Matrix4.translationValues(50, 43, 0.0),
              child: const Text(
                'صرح',
                style: TextStyle(color: Colors.black, fontSize: 28),
              ),
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
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              buttons(
                context,
                "استشارات فورية",
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Consulations()),
                  );
                },
                Color(0xFFEFA7A7),
                Color(0xFF99CFA5),
              ),
              const SizedBox(height: 50,),
              buttons(context, "جلسات مجدولة", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Consulations()),
                );
              },
                Color(0xFFFFD972),
                Color(0xFF99CFA5),
              ),
              const SizedBox(height: 50,),
              buttons(context, "حجز موعد جلسة", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Consulations()),
                );
              },
                Color(0xFFEFA7A7),
                Color(0xFF99CFA5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buttons(context, String title, Function onTap,
      Color color1, Color color2) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Stack(
        children: [
          Container(
              height: 75.0,
              width: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    // Color(0xFFEFA7A7),
                    // Color(0xFF99CFA5),
                    color1,
                    color2,
                  ],
                ),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ))),
          Positioned(
              bottom: 25,
              left: 1,
              child: ClipRect(
                  child: Align(
                alignment: Alignment.topLeft,
                widthFactor: 10,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFFC7EAE4),
                          const Color(0xFFC7EAE4).withOpacity(0.4),
                        ]),
                  ),
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                        size: 19,
                      ),
                    ],
                  ),
                ),
              ))),
          Positioned(
              bottom: 43,
              left: 21,
              child: ClipRect(
                  child: Align(
                alignment: Alignment.topLeft,
                widthFactor: 1,
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFFFFD972),
                          Color(0xFFEFA7A7),
                        ]),
                  ),
                ),
              )))
        ],
      ),
    );
  }
}
