import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sarh/Screens/LogRegPage.dart';
import 'package:sarh/Screens/Navigation.dart';
import 'package:sarh/reusable_widgets/reusable_widget.dart';

class VerifyEmailPage extends StatefulWidget {
  final User user;
  final String firstName;
  final String lastName;
  final String date;
  final bool isSpecialist;

  const VerifyEmailPage({
    super.key,
    required this.user,
    required this.firstName,
    required this.lastName,
    required this.date,
    required this.isSpecialist,
  });

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      // Utils.showSnackBar(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isEmailVerified) {
      addUserDetails(
        widget.firstName,
        widget.lastName,
        widget.user.email!,
        widget.date,
        widget.user.uid,
        widget.isSpecialist
      );
      print(widget.isSpecialist);
      print(widget.firstName);
      print(widget.lastName);
      print(widget.user.email!);
      print(widget.date);
      print(widget.user.uid);

      return const Navigation();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Verify Email"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'يرجى تأكيد الايميل بالرابط المرسل على ${widget.user.email}',
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              firebaseUIButton(context, "اعادة الارسال", () {
                if (canResendEmail) {
                  sendVerificationEmail();
                }
              }),
              GestureDetector(
                child: const Text(
                  "الغاء",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                onTap: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    print("Signed Out");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LogRegPage(),
                      ),
                    );
                  });
                },
              ),
            ],
          ),
        ),
      );
    }
  }
}

Future<void> addUserDetails(String firstName, String lastName, String email,
    String date, String uid, bool isSpecialist) async {
  String collectionName = isSpecialist ? 'specialists' : 'users';

  await FirebaseFirestore.instance.collection(collectionName).doc(uid).set({
    'first name': firstName,
    'last name': lastName,
    'date': date,
    'email': email,
    'uid': uid,
    'isSpecialist': isSpecialist,
  });
}