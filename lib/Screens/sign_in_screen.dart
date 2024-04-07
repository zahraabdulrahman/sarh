import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sarh/Screens/Navigation.dart';
import 'package:sarh/Screens/register.dart';
import 'package:sarh/SpecialistScreens/Specialist_navigation.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:sarh/reusable_widgets/reusable_widget.dart';
// import 'package:firebase_signin/screens/home_screen.dart';
// import 'package:firebase_signin/screens/reset_password.dart';
// import 'package:firebase_signin/screens/signup_screen.dart';
// import 'package:firebase_signin/utils/color_utils.dart';
import 'package:flutter/material.dart';

import 'forgot_pw_page.dart';

class Sign_in_screen extends StatefulWidget {
  const Sign_in_screen({super.key});

  @override
  State<Sign_in_screen> createState() => _Sign_in_screenState();
}

class _Sign_in_screenState extends State<Sign_in_screen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
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
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 350),
             Row(children: [
              Transform(
                transform: Matrix4.translationValues(-10, 0.0, 0.0),
                child: const Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3A3A3A),
                  ),
                ),
              )
            ]),
            const SizedBox(
              height: 10,
            ),

            Row(
              children: [
                Transform(
                  transform: Matrix4.translationValues(-10, 0.0, 0.0),
                  child: const Text(
                    "البريد الالكتروني",
                    style: TextStyle(
                      color: Color(0xFFB9B9B9),
                    ),
                  ),
                )
              ],
            ),

            reusableTextField("ادخل بريدك الالكتروني", Icons.email, false,_emailTextController),

            const SizedBox(
              height: 10,
            ),

            Row(
              children: [
                Transform(
                  transform: Matrix4.translationValues(-10, 0.0, 0.0),
                  child: const Text(
                    "كلمة السر",
                    style: TextStyle(
                      color: Color(0xFFB9B9B9),
                    ),
                  ),
                )
              ],
            ),

            reusableTextField("ادخل كلمة السر", Icons.lock, true, _passwordTextController),

            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                children: [
                  Transform(
                    transform: Matrix4.translationValues(-10, 0.0, 0.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context){
                              return const forgot_pw_page();
                            }));
                      },
                      child: const Text(
                        "نسيت كلمة المرور؟",
                        style: TextStyle(
                          color: Color(0xFF9ED9AE),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            // Center(
            //   child: firebaseUIButton(context, "تسجيل الدخول", () {
            //         FirebaseAuth.instance
            //             .signInWithEmailAndPassword(
            //                 email: _emailTextController.text,
            //                 password: _passwordTextController.text)
            //             .then((value) {
            //           Navigator.push(context,
            //               MaterialPageRoute(builder: (context) => const Navigation()));
            //         }).onError((error, stackTrace) {
            //           print("Error ${error.toString()}");
            //         });
            //       }),
            // ),

            Center(
              child: firebaseUIButton(context, "تسجيل الدخول", () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text)
                    .then((value) async {
                  final isSpecialist = await isUserSpecialist(value.user!);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => isSpecialist
                          ? const Navigation() // Replace with your specialist navigation page
                          : const Specialist_navigation(), // Replace with your user navigation page
                    ),
                  );
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              }),
            ),

            signUpOption() ,
          ],
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("لايوجد لديك حساب؟", style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Register_screen()));
          },
          child: const Text(
            "التسجيل",
            style: TextStyle(color: Color(0xFF9ED9AE), fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

