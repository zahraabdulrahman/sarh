import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sarh/reusable_widgets/reusable_widget.dart';
import 'register.dart';
import 'package:sarh/Screens/VerifyEmailPage.dart';

//import 'package:image_picker/image_picker.dart';
class Register_student extends StatefulWidget {
  const Register_student({super.key});

  @override
  State<Register_student> createState() => _Register_studentState();
}

class _Register_studentState extends State<Register_student> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _firstNameTextController =
      TextEditingController();
  final TextEditingController _lastNameTextController = TextEditingController();
  final TextEditingController _dateinput = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
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
          Container(child: Image.asset('assets/images/pfp.png')),
          const SizedBox(
            height: 0,
          ),
          const Row(
            children: [
              SizedBox(
                width: 260,
              ),
              Text(
                "البريد الالكتروني",
                style: TextStyle(
                  color: Color(0xFF3A3A3A),
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
          // Row(
          //   children: [
          //     const SizedBox(width: 30,),
          //     Container(
          //         height: 49, width: 315,
          //         alignment: Alignment.centerRight,
          //         child: const TextField(
          //           textDirection: TextDirection.rtl,
          //           decoration: InputDecoration(
          //             labelText: '',
          //             hintText: 'ادخل بريدك الالكتروني',
          //             border: UnderlineInputBorder(
          //                 borderSide: BorderSide(
          //                     color: Color(0xFFA7E8BD),
          //                     width: 1
          //                 )
          //             ),
          //           ),
          //         )),],
          // ),
          const Row(
            children: [
              SizedBox(
                width: 285,
              ),
              Text(
                "الاسم الاول",
                style: TextStyle(
                  color: Color(0xFF3A3A3A),
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
          // Row(
          //   children: [
          //     const SizedBox(
          //       width: 30,
          //     ),
          //     Container(
          //         height: 49,
          //         width: 315,
          //         alignment: Alignment.centerRight,
          //         child: const TextField(
          //           textDirection: TextDirection.rtl,
          //           decoration: InputDecoration(
          //             labelText: '',
          //             hintText: 'اسمك الاول',
          //             border: UnderlineInputBorder(
          //                 borderSide:
          //                     BorderSide(color: Color(0xFFA7E8BD), width: 1)),
          //           ),
          //         )),
          //   ],
          // ),
          const Row(
            children: [
              SizedBox(
                width: 288,
              ),
              Text(
                "اسم العائلة",
                style: TextStyle(
                  color: Color(0xFF3A3A3A),
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
          // const SizedBox(
          //   height: 10,
          // ),
          // Row(
          //   children: [
          //     const SizedBox(
          //       width: 30,
          //     ),
          //     Container(
          //         height: 49,
          //         width: 315,
          //         alignment: Alignment.centerRight,
          //         child: const TextField(
          //           textDirection: TextDirection.rtl,
          //           decoration: InputDecoration(
          //             labelText: '',
          //             hintText: 'اسمك الاخير',
          //             border: UnderlineInputBorder(
          //                 borderSide:
          //                     BorderSide(color: Color(0xFFA7E8BD), width: 1)),
          //           ),
          //         )),
          //   ],
          // ),
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
          // const Row(
          //   children: [
          //     SizedBox(
          //       width: 279,
          //     ),
          //     Text(
          //       "تاريخ الميلاد",
          //       style: TextStyle(
          //         color: Color(0xFF3A3A3A),
          //       ),
          //     )
          //   ],
          // ),
          // Row(
          //   children: [
          //     const SizedBox(
          //       width: 30,
          //     ),
          //     Container(
          //         height: 49,
          //         width: 315,
          //         alignment: Alignment.centerRight,
          //         child: const TextField(
          //           textDirection: TextDirection.rtl,
          //           decoration: InputDecoration(
          //             labelText: '',
          //             hintText: 'يوم ميلادك',
          //             border: UnderlineInputBorder(
          //                 borderSide:
          //                     BorderSide(color: Color(0xFFA7E8BD), width: 1)),
          //           ),
          //         )),
          //   ],
          // ),
          const Row(
            children: [
              SizedBox(
                width: 285,
              ),
              Text(
                "كلمة المرور",
                style: TextStyle(
                  color: Color(0xFF3A3A3A),
                ),
              )
            ],
          ),
          SizedBox(
            width: 400,
            height: 40,
            child: reusableTextField(
                "ادخل كلمة السر", Icons.lock, false, _passwordTextController),
          ),
          const SizedBox(
            height: 10,
          ),
          // Row(
          //   children: [
          //     const SizedBox(
          //       width: 30,
          //     ),
          //     Container(
          //         height: 49,
          //         width: 315,
          //         alignment: Alignment.centerRight,
          //         child: const TextField(
          //           textDirection: TextDirection.rtl,
          //           decoration: InputDecoration(
          //             labelText: '',
          //             hintText:
          //                 'يجب ان يحتوي على حروف كبيرة وصغيره ورمز واحد على الأقل',
          //             border: UnderlineInputBorder(
          //                 borderSide:
          //                     BorderSide(color: Color(0xFFA7E8BD), width: 1)),
          //           ),
          //         )),
          //   ],
          // ),
          const Row(
            children: [
              SizedBox(
                width: 258,
              ),
              Text(
                "تأكيد كلمة المرور",
                style: TextStyle(
                  color: Color(0xFF3A3A3A),
                ),
              )
            ],
          ),
          SizedBox(
            width: 400,
            height: 40,
            child: reusableTextField(
                " ادخل كلمة السر مجددا", Icons.lock, false, _confirmPass),
          ),
          // Row(
          //   children: [
          //     const SizedBox(
          //       width: 30,
          //     ),
          //     Container(
          //         height: 49,
          //         width: 315,
          //         alignment: Alignment.centerRight,
          //         child: const TextField(
          //           textDirection: TextDirection.rtl,
          //           decoration: InputDecoration(
          //             labelText: '',
          //             hintText: 'إعادة كتابة كلمة المرور',
          //             border: UnderlineInputBorder(
          //                 borderSide:
          //                     BorderSide(color: Color(0xFFA7E8BD), width: 1)),
          //           ),
          //         )),
          //   ],
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // Container(
          //   padding: const EdgeInsets.only(left: 30),
          //   height: 72,
          //   width: 315,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(28),
          //     color: const Color(0xFFA7E8BD),
          //   ),
          //   child: const Row(children: [
          //     Icon(
          //       Icons.arrow_back,
          //       color: Colors.black,
          //       size: 19,
          //     ),
          //     SizedBox(width: 130),
          //     Center(
          //       child: Text("إكمال",
          //           style: TextStyle(
          //             fontSize: 20,
          //           )),
          //     )
          //   ]),
          // )
          firebaseUIButton(context, "اكمال", () {
            if (confirmedPasssowrd()) {
              FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                  .then((value) {
                print("Created New Account");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const VerifyEmailPage()));
              }).onError((error, stackTrace) {
                print("Error ${error.toString()}");
              });
              addUserDetails(
                  _firstNameTextController.text.trim(),
                  _lastNameTextController.text.trim(),
                  _emailTextController.text.trim(),
                  _dateinput.text.trim());
            }
          })
        ],
      ),
    );
  }

   firstName() {
    Container(
      child: Transform(
        transform: Matrix4.translationValues(320, -3, 0.0),
        child: Text(
          "أهلا ${_firstNameTextController.text.trim()}",
          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
        ),
      ),
    );
  }

  Future addUserDetails(
      String firstName, String lastName, String email, String date) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'date': date,
      'email': email,
    });
  }

  bool confirmedPasssowrd() {
    if (_passwordTextController.text.trim() == _confirmPass.text.trim()) {
      return true;
    } else {
      return false;
    }
  }
}
