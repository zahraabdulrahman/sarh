import 'package:flutter/material.dart';
import 'sign_in_screen.dart';
import 'register.dart';
class LogRegPage extends StatelessWidget {
  const LogRegPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Shapes.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            )
          ),
        child: Center(
              child: Column(
                children: [
                  const SizedBox(height:400),
                  const SizedBox(
                    height: 170.61,
                    width: 303,
                    child: Image(
                      image: AssetImage("assets/images/sarhLogo.png"),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Sign_in_screen()),
                      );
                    },
                    child: Stack(
                        children: [
                        Container(
                        height: 72,
                        width: 315,
                        decoration:
                        BoxDecoration(gradient: const LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Color(0xFFA7E8BD),
                            Color(0xFF99CFA5), ],),
                          borderRadius: BorderRadius.circular(28),)
                          ,
                          child: const Align(alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Text("تسجيل الدخول",
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
                  const SizedBox(height: 30),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Register_screen()),
                );
              },
                      child: Container(
                          padding: const EdgeInsets.only(left: 30),
                        height: 72,
                        width: 315,
                        decoration:
                        BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: const Color(0xFFA7E8BD),
                        width: 1),),
                        child:
                          const Row(children: [
                            Icon(Icons.arrow_back,
                                   color: Color(0xFFA7E8BD),
                                   size: 19,),
                            SizedBox(width: 130),
                          Expanded(
                            child: Text("التسجيل",
                                       style: TextStyle(fontSize: 20, color: Color(0xFFA7E8BD),)),
                          )]),

            ),
          )
  ]),
    ),
    ),
    );
  }
}
