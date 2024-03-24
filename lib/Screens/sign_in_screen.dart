import 'package:firebase_auth/firebase_auth.dart';
import 'package:sarh/Screens/Navigation.dart';
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
            const Row(children: [
              SizedBox(
                width: 177,
              ),
              Text(
                'تسجيل الدخول',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3A3A3A),
                ),
              )
            ]),
            const SizedBox(
              width: 100,
              height: 10,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 258,
                ),
<<<<<<< HEAD
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
=======
                Text(
                  "البريد الالكتروني",
                  style: TextStyle(
                    color: Color(0xFFB9B9B9),
                  ),
                )
>>>>>>> 45a484bed783e2e0ecae6087b53966ae2445a0ce
              ],
            ),
            reusableTextField("ادخل بريدك الالكتروني", Icons.email, false,
                _emailTextController),
            const SizedBox(
              width: 100,
              height: 10,
            ),
            // Row(
            //   children: [
            //     const SizedBox(width: 30,),
            //     Container(
            //       height: 49, width: 315,
            //       alignment: Alignment.centerRight,
            //       child: const TextField(
            //         textDirection: TextDirection.rtl,
            //         decoration: InputDecoration(
            //           labelText: '',
            //           hintText: 'ادخل بريدك الالكتروني',
            //           prefixIcon: Icon(Icons.check),
            //           border: UnderlineInputBorder(
            //               borderSide: BorderSide(
            //                   color: Color(0xFFA7E8BD),
            //                   width: 1
            //               )
            //           ),
            //         ),
            //       )),],
            // ),
            const Row(
              children: [
                SizedBox(
                  width: 258,
                  height: 30,
                ),
                Text(
                  "كلمة السر",
                  style: TextStyle(
                    color: Color(0xFFB9B9B9),
                  ),
                )
              ],
            ),
            reusableTextField(
                "ادخل كلمة السر", Icons.lock, true, _passwordTextController),
            // Row(
            //   children: [
            //     const SizedBox(width: 30,),
            //     Container(
            //         height: 49, width: 315,
            //         alignment: Alignment.centerRight,
            //         child: const TextField(
            //           obscureText: true,
            //           textDirection: TextDirection.rtl,
            //           decoration: InputDecoration(
            //             labelText: '',
            //             hintText: 'ادخل كلمة السر',
            //             prefixIcon: Icon(Icons.lock),
            //             border: UnderlineInputBorder(
            //                 borderSide: BorderSide(
            //                     color: Color(0xFFA7E8BD),
            //                     width: 1
            //                 )
            //             ),
            //           ),
            //         )),
            //   ],
            // ),
            const Row(
              children: [
                SizedBox(
                  width: 245,
                ),
                Text(
                  "نسيت كلمة المرور؟",
                  style: TextStyle(
                    color: Color(0xFF9ED9AE),
                  ),
                )
              ],
            ),
            firebaseUIButton(context, "تسجيل الدخول", () {
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
