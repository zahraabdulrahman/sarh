import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sarh/reusable_widgets/reusable_widget.dart';
import 'register.dart';
import 'package:sarh/Screens/VerifyEmailPage.dart';
import 'package:sarh/Screens/sign_in_screen.dart';

//import 'package:image_picker/image_picker.dart';
class Register_student extends StatefulWidget {
  const Register_student({super.key});

  @override
  State<Register_student> createState() => _Register_studentState();
}

class _Register_studentState extends State<Register_student> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  late TextEditingController _firstNameTextController;
  late TextEditingController _lastNameTextController;
  late TextEditingController _dateinput;
  final TextEditingController _confirmPass = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firstNameTextController = TextEditingController();
    _lastNameTextController = TextEditingController();
    _dateinput = TextEditingController();
  }


  @override
  void dispose() {
    _passwordTextController.dispose();
    _emailTextController.dispose();
    _firstNameTextController.dispose();
    _lastNameTextController.dispose();
    _dateinput.dispose();
    _confirmPass.dispose();
    super.dispose();
  }

  Uint8List? _image;
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    _image = img;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 50,
            color: Color(0xFFA7E8BD),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Register_screen()),
            );
          },
        ),
      ), //icon to get back
      body: Column(
        children: [
          Stack(
            children: [
              _image != null
                  ? CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(_image!),
                     )
                  : const CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIwRBD9gNuA2GjcOf6mpL-WuBhJADTWC3QVQ&usqp=CAU'),
                    ),
              Positioned(
                bottom: -10,
                left: 80,
                child: IconButton(
                  onPressed: selectImage,
                  icon: const Icon(Icons.add_a_photo),
                ),
              ),
            ],
          ),

          // Container(child: Image.asset('assets/images/pfp.png')),
          // const SizedBox(
          //   height: 0,
          // ),
          Row(
            children: [
              Transform(
                transform: Matrix4.translationValues(-10, 0.0, 0.0),
                child: const Text(
                  "البريد الالكتروني",
                  style: TextStyle(
                    color: Color(0xFF3A3A3A),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 400,
            height: 40,
            child: reusableTextField("ادخل بريدك الالكتروني", Icons.email,
                false, _emailTextController),
          ),
          const SizedBox(
            height: 10,
          ),

          Row(
            children: [
              Transform(
                transform: Matrix4.translationValues(-10, 0.0, 0.0),
                child: const Text(
                  "الاسم الاول",
                  style: TextStyle(
                    color: Color(0xFF3A3A3A),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 400,
            height: 40,
            child: reusableTextField("ادخل اسمك الاول", Icons.email, false,
                _firstNameTextController),
          ),
          const SizedBox(
            height: 5,
          ),

          Row(
            children: [
              Transform(
                transform: Matrix4.translationValues(-10, 0.0, 0.0),
                child: const Text(
                  "اسم العائلة",
                  style: TextStyle(
                    color: Color(0xFF3A3A3A),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 400,
            height: 40,
            child: reusableTextField("ادخل اسمك الاخير", Icons.email, false,
                _lastNameTextController),
          ),

          Container(
              padding: const EdgeInsets.all(15),
              child: Center(
                  child: TextField(
                controller: _dateinput, //editing controller of this TextField
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "يوم ميلادك" //label text of field
                    ),
                readOnly:
                    true, //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(
                          1900), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime.now());

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      _dateinput.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              ))),

          Row(
            children: [
              Transform(
                transform: Matrix4.translationValues(-10, 0.0, 0.0),
                child: const Text(
                  "كلمة المرور",
                  style: TextStyle(
                    color: Color(0xFF3A3A3A),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 400,
            height: 40,
            child: reusableTextField(
                "ادخل كلمة السر", Icons.lock, true, _passwordTextController),
          ),
          const SizedBox(
            height: 10,
          ),

          Row(
            children: [
              Transform(
                transform: Matrix4.translationValues(-10, 0.0, 0.0),
                child: const Text(
                  "تأكيد كلمة المرور",
                  style: TextStyle(
                    color: Color(0xFF3A3A3A),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 400,
            height: 40,
            child: reusableTextField(
                " ادخل كلمة السر مجددا", Icons.lock, true, _confirmPass),
          ),

          firebaseUIButton(context, "اكمال", ()async{
            if (confirmedPasssowrd()) {
              createAccountAndSendVerificationEmail(context,
                firstName: _firstNameTextController.text.trim(),
                lastName: _lastNameTextController.text.trim(),
                date: _dateinput.text.trim(),
              );
            }
          }),
          signInOption(),
        ],
      ),
    );
  }

  Container firstName() {
    return Container(
      child: Transform(
        transform: Matrix4.translationValues(320, -3, 0.0),
        child: Text(
          "أهلا ${_firstNameTextController.text.trim()}",
          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
        ),
      ),
    );
  }

  // Future<void> addUserDetails(
  //     String firstName, String lastName, String email, String date, String uid) async {
  //   await FirebaseFirestore.instance.collection('users').doc(uid).set({
  //     'first name': firstName,
  //     'last name': lastName,
  //     'date': date,
  //     'email': email,
  //     'uid': uid, // Include the UID in the document data
  //   });
  // }
  Future<void> createAccountAndSendVerificationEmail(BuildContext context, {
    required String firstName,
    required String lastName,
    required String date,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      );

      await userCredential.user!.sendEmailVerification();

      print("Verification email sent");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerifyEmailPage(
            user: userCredential.user!, // Pass the user object here
            firstName: firstName,
            lastName: lastName,
            date: date,
          ),
        ),
      );
    } catch (e) {
      print("Error creating user: $e");
      // Handle errors here, such as displaying an error message to the user
    }
  }


  bool confirmedPasssowrd() {
    if (_passwordTextController.text.trim() == _confirmPass.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Widget signInOption() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Sign_in_screen()),
        );
      },
      child: const Text(
        "لديك حساب بالفعل؟ تسجيل الدخول",
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
