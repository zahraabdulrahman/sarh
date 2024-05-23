import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sarh/User_Screens/Register_student.dart';

import '../Register_and_signin/sign_in_screen.dart';

// import 'package:xyz/utils/pixel_sizes.dart';
TextField reusableTextField(
  String text,
  IconData icon,
  bool isPasswordType,
  TextEditingController controller,
  bool isInputWrong, // Add a parameter to indicate if input is wrong
) {
  Color borderColor = isInputWrong? Colors.red : Colors.grey.withOpacity(0.9);

  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: borderColor),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: -5),
      prefixIcon: Icon(
        icon,
        color: Colors.grey,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: borderColor),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}
// TextField reusableTextField(String text, IconData icon, bool isPasswordType,
//     TextEditingController controller) {
//   return TextField(
//     controller: controller,
//     obscureText: isPasswordType,
//     enableSuggestions: !isPasswordType,
//     autocorrect: !isPasswordType,
//     cursorColor: Colors.white,
//     style: TextStyle(color: Colors.grey.withOpacity(0.9)),
//     decoration: InputDecoration(
//       contentPadding: const EdgeInsets.symmetric(vertical: -5),
//       prefixIcon: Icon(
//         icon,
//         color: Colors.grey,
//       ),
//       labelText: text,
//       labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
//       filled: true,
//       floatingLabelBehavior: FloatingLabelBehavior.never,
//       fillColor: Colors.white.withOpacity(0.3),
//       focusedBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(color: Color(0xFFA7E8BD))),
//     ),
//     keyboardType: isPasswordType
//         ? TextInputType.visiblePassword
//         : TextInputType.emailAddress,
//   );
// }

Container firebaseUIButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: 250,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(28)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return const Color.fromARGB(255, 6, 52, 0);
            }
            return const Color(0xFFA7E8BD);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      //   child: Text(
      //     title,
      //     style: const TextStyle(
      //         color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      //   ),
      // ),
    ),
  );
}

void showDatePickerOnTextField(
    BuildContext context, TextEditingController dateInput) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2017),
  );

  if (pickedDate != null) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
    dateInput.text = formattedDate;
  } else {
    print("Date is not selected");
  }
}

Container settingUIButton(
    BuildContext context, String title, IconData icon, Function onTap) {
  return Container(
      child: ElevatedButton.icon(
    icon: Icon(
      icon,
      color: Colors.green,
      size: 20.0,
    ),
    label: Text(
      title,
      style: TextStyle(color: Colors.grey.withOpacity(0.9)),
    ),
    onPressed: () {
      onTap();
    },
  ));
}

pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);
  if (file != null) {
    return await file.readAsBytes();
  }
  print('No Images Selected');
}

GestureDetector buttons(context, height, width, String title, Function onTap) {
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: Stack(
      children: [
        Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Color(0xFFA7E8BD),
                  Color(0xFF99CFA5),
                ],
              ),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ))),
        Positioned(
            bottom: 10,
            left: 1,
            child: ClipRect(
                child: Align(
              alignment: Alignment.topLeft,
              widthFactor: 1,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFFC7EAE4),
                        const Color(0xFFC7EAE4).withOpacity(0.4),
                      ]),
                ),
                child: const Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ))),
        Positioned(
            bottom: 35,
            left: 14,
            child: ClipRect(
                child: Align(
              alignment: Alignment.topLeft,
              widthFactor: 1,
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFFFFD972),
                        Color(0xFFEFA7A7),
                      ]),
                ),
              ),
            )))
      ],
    ),
  );
}

Future<String?> uploadPDFToFirebase(File pdfFile) async {
  try {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('uploads/pdfs/${DateTime.now().millisecondsSinceEpoch}.pdf');
    await storageRef.putFile(pdfFile);
    final downloadUrl = await storageRef.getDownloadURL();
    return downloadUrl;
  } on FirebaseException catch (e) {
    print(e.message);
    return null;
  }
}

Widget signInOption(BuildContext context) {
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

GestureDetector buttons2(context, height, width, bottom1, left1, bottom2,
    left2, String title, Function onTap, Color color1, Color color2) {
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: Stack(
      children: [
        Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  // Color(0xFFEFA7A7),
                  // Color(0xFF99CFA5),
                  color1,
                  color2,
                ],
              ),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ))),
        Positioned(
            bottom: bottom1,
            left: left1,
            child: ClipRect(
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 10,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xFFC7EAE4),
                            const Color(0xFFC7EAE4).withOpacity(0.4),
                          ]),
                    ),
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        // Icon(
                        //   Icons.upload,
                        //   color: Colors.black,
                        //   size: 19,
                        // ),
                      ],
                    ),
                  ),
                ))),
        Positioned(
            bottom: bottom2,
            left: left2,
            child: ClipRect(
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 1,
                  child: Container(
                    width: 65,
                    height: 65,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFFFFD972),
                            Color(0xFFEFA7A7),
                          ]),
                    ),
                  ),
                )))
      ],
    ),
  );
}