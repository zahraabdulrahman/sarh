import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sarh/Screens/Navigation.dart';

class Sign_in_screen extends StatelessWidget {
  const Sign_in_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.amber.shade100
                ),
                height: 60,
                width: 250,
                child: CupertinoButton(
                  child: const Text('تسجيل الدخول', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20),),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const Navigation()),
                    );
                  },
                ),
              ),
            ),
          ),
        ],),),
    );
  }}