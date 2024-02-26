import 'package:flutter/material.dart';
import 'Register_student.dart';
class Register_screen extends StatelessWidget {
  const Register_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Shapes_2.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            )
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children:[
            const SizedBox(height:400),
              const Row(
            children: [
              SizedBox(width: 255,),
              Text(
                'التسجيل',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3A3A3A),
                ),
              )
            ]),
              const SizedBox(height: 80,),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Register_student()),
            );
          },
              child: Center(child:Stack(
                children: [
                  Container(
                      height: 72,
                      width: 315,
                      decoration:
                      BoxDecoration(gradient: const LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Color(0xFFEFA7A7),
                          Color(0xFF99CFA5), ],),
                        borderRadius: BorderRadius.circular(28),)
                      ,
                      child: const Align(alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Text("التسجيل كطالب",
                                style: TextStyle(fontSize: 20, color: Colors.white,)),
                          )
                      )
                  ),
                  Positioned(
                      bottom: 10,
                      left: 0,
                      child: ClipRect(
                          child: Align(
                            alignment: Alignment.topLeft,
                            widthFactor: 1,
                            child: Container(
                              width: 76,
                              height: 76,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      const Color(0xFFC7EAE4),
                                      const Color(0xFFC7EAE4).withOpacity(0.4),
                                    ]
                                ),
                              ),
                              child: const Column(
                                children: [
                                  SizedBox(height: 41,),
                                  Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 19,
                                  ),
                                ],
                              ),
                            ),
                          )
                      )
                  ),
                  Positioned(
                      bottom: 43,
                      left: 14,
                      child: ClipRect(
                          child: Align(
                            alignment: Alignment.topLeft,
                            widthFactor: 1,
                            child: Container(
                              width: 76,
                              height: 76,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xFFFFD972),
                                      Color(0xFFEFA7A7),
                                    ]
                                ),
                              ),
                            ),
                          )
                      )
                  )
                ],
              ),
              ),
        ),
              const SizedBox(height: 45,),
              Center(child:Stack(
                children: [
                  Container(
                      height: 72,
                      width: 315,
                      decoration:
                      BoxDecoration(gradient: const LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Color(0xFFFFD972),
                          Color(0xFF99CFA5), ],),
                        borderRadius: BorderRadius.circular(28),)
                      ,
                      child: const Align(alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Text("التسجيل كاخصائي",
                                style: TextStyle(fontSize: 20, color: Colors.white,)),
                          )
                      )
                  ),
                  Positioned(
                      bottom: 10,
                      left: 0,
                      child: ClipRect(
                          child: Align(
                            alignment: Alignment.topLeft,
                            widthFactor: 1,
                            child: Container(
                              width: 76,
                              height: 76,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      const Color(0xFFC7EAE4),
                                      const Color(0xFFC7EAE4).withOpacity(0.4),
                                    ]
                                ),
                              ),
                              child: const Column(
                                children: [
                                  SizedBox(height: 41,),
                                  Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 19,
                                  ),
                                ],
                              ),
                            ),
                          )
                      )
                  ),
                  Positioned(
                      bottom: 43,
                      left: 14,
                      child: ClipRect(
                          child: Align(
                            alignment: Alignment.topLeft,
                            widthFactor: 1,
                            child: Container(
                              width: 76,
                              height: 76,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xFFFFD972),
                                      Color(0xFFEFA7A7),
                                    ]
                                ),
                              ),
                            ),
                          )
                      )
                  )
                ],),),
            ],

      ),

    ),);
  }}