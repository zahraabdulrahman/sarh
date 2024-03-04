import 'package:flutter/material.dart';

class Sign_in_screen extends StatelessWidget {
  const Sign_in_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage('assets/img/Shapes_2.png'),
    fit: BoxFit.fitWidth,
    alignment: Alignment.topCenter,
    )
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(height:350),
        const Row(
          children: [
            SizedBox(width: 177,),
            Text(
              'تسجيل الدخول',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3A3A3A),
              ),
            )
    ]),
        const SizedBox(width: 100,),
        const Row(
          children: [
            SizedBox(width: 258,),
            Text("البريد الالكتروني", style: TextStyle(color: Color(0xFFB9B9B9),),)
          ],
        ),

        Row(
          children: [
            const SizedBox(width: 30,),
            Container(
              height: 49, width: 315,
              alignment: Alignment.centerRight,
              child: const TextField(
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  labelText: '',
                  hintText: 'ادخل بريدك الالكتروني',
                  prefixIcon: Icon(Icons.check),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFFA7E8BD),
                          width: 1
                      )
                  ),
                ),
              )),],
        ),
        const Row(
          children: [
            SizedBox(width: 258,),
            Text("كلمة السر", style: TextStyle(color: Color(0xFFB9B9B9),),)
          ],
        ),
        Row(
          children: [
            const SizedBox(width: 30,),
            Container(
                height: 49, width: 315,
                alignment: Alignment.centerRight,
                child: const TextField(
                  obscureText: true,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    labelText: '',
                    hintText: 'ادخل كلمة السر',
                    prefixIcon: Icon(Icons.lock),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFFA7E8BD),
                            width: 1
                        )
                    ),
                  ),
                )),
          ],
        ),
        const Row(
          children: [
            SizedBox(width: 245,),
            Text("نسيت كلمة المرور؟", style: TextStyle(color: Color(0xFF9ED9AE),),
            )],
        ),

          const SizedBox(height: 70),
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
          ],),)
        ,],),),
    );
  }}