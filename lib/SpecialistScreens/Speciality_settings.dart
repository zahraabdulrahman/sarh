import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sarh/User_Screens/CardsSettings.dart';
import 'package:sarh/User_Screens/AboutSarh.dart';
import 'package:sarh/Register_and_signin/sign_in_screen.dart';


class Speciality_settings extends StatefulWidget {
  const Speciality_settings({super.key});

  @override
  State<Speciality_settings> createState() => _Speciality_settings();
}

class _Speciality_settings extends State<Speciality_settings> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> onlineStatus() async {
    final uid = FirebaseAuth.instance.currentUser?.uid; // Use null-safe operator
    if (uid != null) {
      try {
        await _firestore.collection('specialists').doc(uid).update({
          'status': 'offline',
        });
        print("User status updated successfully");
      } catch (error) {
        print("Error updating user status: $error");
      }
    }
  }

  Future<void> signOut() async {
    try {
      onlineStatus().then((value) async => await FirebaseAuth.instance.signOut()); // Update online status to offline
      print("Signed Out");
    } catch (error) {
      print("Error signing out: $error");
      // Handle error (optional: show a snackbar or dialog)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(

        ),
        body: SafeArea(
          child: Center(
            child: Expanded(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Transform(
                          transform: Matrix4.translationValues(-10, 0.0, 0.0),
                          child: const Icon(Icons.chat_bubble_outline_rounded),),
                        GestureDetector(
                            child: const Text(
                              "     اعدادات البطاقات",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const CardsSettings()),
                              );
                            }),
                        Transform(
                          transform: Matrix4.translationValues(-40, 0.0, 0.0),
                          child: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                            size: 19,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 252, 188, 184),
                    thickness: 5,
                    indent: 7,
                    endIndent: 150,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Transform(
                          transform: Matrix4.translationValues(-10, 0.0, 0.0),
                          child: const Icon(Icons.chat_bubble_outline_rounded),),
                        GestureDetector(
                            child: const Text(
                              "     عن صرح",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const AboutSarh()),
                              );
                            }),
                        Transform(
                          transform: Matrix4.translationValues(-110, 0.0, 0.0),
                          child: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                            size: 19,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 255, 217, 114),
                    thickness: 5,
                    indent: 7,
                    endIndent: 150,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Transform(
                          transform: Matrix4.translationValues(-10, 0.0, 0.0),
                          child: const Icon(Icons.chat_bubble_outline_rounded),),
                        GestureDetector(
                            child: const Text(
                              "     حذف الحساب",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const CardsSettings()),
                              );
                            }),
                        Transform(
                          transform: Matrix4.translationValues(-70, 0.0, 0.0),
                          child: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                            size: 19,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 199, 234, 228),
                    thickness: 5,
                    indent: 7,
                    endIndent: 150,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Transform(
                          transform: Matrix4.translationValues(-10, 0.0, 0.0),
                          child: const Icon(Icons.chat_bubble_outline_rounded),),
                        GestureDetector(
                          child: const Text(
                            "     تسجيل خروج",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          onTap: () async{
                            await signOut();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const Sign_in_screen()));
                          },),
                        Transform(
                          transform: Matrix4.translationValues(-70, 0.0, 0.0),
                          child: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                            size: 19,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 255, 217, 114),
                    thickness: 5,
                    indent: 7,
                    endIndent: 150,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
