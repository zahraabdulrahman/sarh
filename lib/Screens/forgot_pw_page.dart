import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../reusable_widgets/reusable_widget.dart';

class forgot_pw_page extends StatefulWidget {
  const forgot_pw_page({super.key});

  @override
  State<forgot_pw_page> createState() => _forgot_pw_pageState();
}

class _forgot_pw_pageState extends State<forgot_pw_page> {
  final _emailTextController = TextEditingController();
  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
}
Future passowrdReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailTextController.text.trim());
      showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              content: Text('تم ارسال رابط تغيير الايميل'),
            );
          });
    }on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              content: Text('الايميل المدخل خاطئ حاول مجدداً'),
            );
          });
    }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ادخل ايميلك وسيتم ارسال رابط اعادة كلمة المرور '),
            SizedBox(height: 25,),
            reusableTextField("ادخل بريدك الالكتروني", Icons.email, false,
                _emailTextController),
            SizedBox(height: 25,),
            firebaseUIButton(context, "تغيير كلمة المرور", () {
              passowrdReset();
            }
            ),
          ],
        ),
      ),
    );
  }
}
