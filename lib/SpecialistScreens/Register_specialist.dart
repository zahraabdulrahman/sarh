import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sarh/reusable_widgets/reusable_widget.dart';
import 'package:sarh/Register_and_signin/VerifyEmailPage.dart';
import 'package:sarh/Register_and_signin/register.dart';
import 'package:sarh/Register_and_signin/sign_in_screen.dart';

//import 'package:image_picker/image_picker.dart';
class Register_specialist extends StatefulWidget {
  const Register_specialist({super.key});

  @override
  State<Register_specialist> createState() => _Register_specialistState();
}

class _Register_specialistState extends State<Register_specialist> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  late TextEditingController _firstNameTextController;
  late TextEditingController _lastNameTextController;
  late TextEditingController _dateinput;
  final TextEditingController _confirmPass = TextEditingController();
  PlatformFile? _selectedFile;
  bool isSpecialist = true;
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

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String? _uploadedPdfUrl;
  bool _fileSelected = false; // Track if a file is selected


  Future<String?> uploadPdf(String fileName, File file) async {

    final refrence = FirebaseStorage.instance.ref().child("pdfs/$fileName.pdf");
    final uploadTask = refrence.putFile(file);

    await uploadTask.whenComplete(() {});

    final downloadLink = await refrence.getDownloadURL();

    return downloadLink;
  }

  Future<void> pickFile() async {
    try {
      final pickFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (pickFile != null) {
        setState(() {
          _selectedFile = pickFile.files[0];
          _fileSelected = true;
        });
      }
    } catch (e) {
      print(e);
    }
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
                radius: 40,
                backgroundImage: MemoryImage(_image!),
              )
                  : const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIwRBD9gNuA2GjcOf6mpL-WuBhJADTWC3QVQ&usqp=CAU'),
              ),
              Positioned(
                bottom: -15,
                left: 40,
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
                    fontSize: 12,
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
                    fontSize: 12,
                    color: Color(0xFF3A3A3A),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 400,
            height: 40,
            child: reusableTextField("ادخل اسمك الاول", Icons.perm_identity_outlined, false,
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
                    fontSize: 12,
                    color: Color(0xFF3A3A3A),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 400,
            height: 40,
            child: reusableTextField("ادخل اسمك الاخير", Icons.perm_identity_outlined, false,
                _lastNameTextController),
          ),

          Container(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: TextField(
                controller: _dateinput, // Controller for this TextField
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today, color: Colors.grey), // Icon for the TextField
                  labelText: "يوم ميلادك", // Label text for the TextField
                  labelStyle: TextStyle(fontSize: 12),
                ),
                readOnly: true, // Set to true to make the field read-only
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(DateTime.now().year - 50, 1, 1), // 50 years ago from today
                    lastDate: DateTime(DateTime.now().year - 20, 12, 31), // 7 years ago from today (Dec 31st)
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          colorScheme: ColorScheme.light(primary: Color(0xFFA7E8BD), onPrimary: Colors.black), // Set primary and text color
                          buttonTheme: ButtonThemeData(
                            textTheme: ButtonTextTheme.primary,
                            colorScheme: ColorScheme.light(primary: Colors.red), // Set button color
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (pickedDate != null) {
                    print(pickedDate); // Debug print: selected date
                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(formattedDate); // Debug print: formatted date

                    setState(() {
                      _dateinput.text = formattedDate; // Set the selected date to the TextField
                    });
                  } else {
                    print("Date is not selected"); // Debug print: no date selected
                  }
                },
              ),
            ),
          ),

          Row(
            children: [
              Transform(
                transform: Matrix4.translationValues(-10, 0.0, 0.0),
                child: const Text(
                  "كلمة المرور",
                  style: TextStyle(
                    fontSize: 12,
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
                    fontSize: 12,
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

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // Change the button color here
            ),
            onPressed: pickFile, child: const Text('ارفع الشهادة', style: TextStyle(color: Colors.black),),
          ),

          firebaseUIButton(context, "اكمال", () async {
            await createAccountAndSendVerificationEmail(context,
              firstName: _firstNameTextController.text.trim(),
              lastName: _lastNameTextController.text.trim(),
              date: _dateinput.text.trim(),
              pdfUrl: _uploadedPdfUrl,
            );
          },

          ),
          signInOption(),
        ],
      ),
    );
  }

  Future<void> createAccountAndSendVerificationEmail(BuildContext context,{
    required String firstName,
    required String lastName,
    required String date,
    // required isSpecialist,
    String? pdfUrl,
  }) async {
    if (_fileSelected && confirmedPasswords()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailTextController.text.trim(),
          password: _passwordTextController.text.trim(),
        );

        await userCredential.user!.sendEmailVerification();

        print("Verification email sent");

        File file = File(_selectedFile!.path!);
        _uploadedPdfUrl = await uploadPdf(_selectedFile!.name, file);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyEmailPage(
              isSpecialist : isSpecialist,
              user: userCredential.user!,
              firstName: _firstNameTextController.text.trim(),
              lastName: _lastNameTextController.text.trim(),
              date: _dateinput.text.trim(), // Adjust this based on your logic
            ),
          ),
        );
      } catch (e) {
        print("Error creating user: $e");
        // Handle errors appropriately, e.g., show a snackbar
      }
    } else {
      if (!_fileSelected) {
        // Show error message indicating missing PDF
      } else {
        // Show error message indicating password mismatch
      }
    }
  }



  bool confirmedPasswords() {
    return _passwordTextController.text.trim() == _confirmPass.text.trim();
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
