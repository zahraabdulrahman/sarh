import 'package:firebase_auth/firebase_auth.dart';
import 'package:sarh/Screens/Navigation.dart';
import 'package:sarh/Screens/forgot_pw_page.dart';
import 'package:sarh/Screens/register.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:sarh/reusable_widgets/reusable_widget.dart';
// import 'package:firebase_signin/screens/home_screen.dart';
// import 'package:firebase_signin/screens/reset_password.dart';
// import 'package:firebase_signin/screens/signup_screen.dart';
// import 'package:firebase_signin/utils/color_utils.dart';
import 'package:flutter/material.dart';

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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
                   ),
                ]),
                const SizedBox(
                  width: 100,
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
                SizedBox(
                  height: 40,
                  child: reusableTextField("ادخل بريدك الالكتروني", Icons.email, false,
                      _emailTextController),
                ),
                const SizedBox(
                  width: 100,
                  height: 15,
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
                SizedBox(
                  height: 40,
                  child: reusableTextField(
                      "ادخل كلمة السر", Icons.lock, false, _passwordTextController),
                ),

                const SizedBox(
                  height: 20,
                ),
                 Row(
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
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: firebaseUIButton(context, "تسجيل الدخول", () {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text)
                            .then((value) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const Navigation()));
                        }).onError((error, stackTrace) {
                          print("Error ${error.toString()}");
                        });
                      }),
                ),
                signUpOption()

                // const SizedBox(height: 70),
                // Center(child: signInSignUpButton(context, false, () {})),
                // signUpOption(),
                // Padding(
                //   padding: const EdgeInsets.only(top: 15.0),
                //   child: Center(
                //     child: Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10.0),
                //         color: Colors.amber.shade100
                //       ),
                //       height: 60,
                //       width: 250,
                //       child: CupertinoButton(
                //         child: const Text('تسجيل الدخول', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20),),
                //         onPressed: () {
                //           Navigator.push(
                //             context,
                //             CupertinoPageRoute(
                //                 builder: (context) => const Navigation()),
                //           );
                //         },
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("لايوجد لديك حساب?", style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Register_screen()));
          },
          child: const Text(
            "التسجيل",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
