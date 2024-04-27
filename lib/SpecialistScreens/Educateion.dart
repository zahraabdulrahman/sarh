import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sarh/SpecialistScreens/Sarh.dart';
import 'package:file_picker/file_picker.dart';
import '../reusable_widgets/reusable_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  String _videoUrl = '';
  String _text = '';

  Future<void> _uploadVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );

    if (result != null) {
      PlatformFile file = result.files.first;

      Reference storageReference =
          FirebaseStorage.instance.ref().child('videos/${file.name}');
      UploadTask uploadTask = storageReference.putFile(File(file.path!));

      await uploadTask.whenComplete(() async {
        String url = await storageReference.getDownloadURL();
        setState(() {
          _videoUrl = url;
        });
      });
    } else {
      // User canceled the file picker
    }
  }

  Future<void> _uploadText() async {
    if (_videoUrl.isNotEmpty) {
      String enteredText = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Enter Text'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  _text = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Enter your text here',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, _text);
                },
                child: const Text('Submit'),
              ),
            ],
          );
        },
      );

      if (enteredText != null) {
        setState(() {
          _text = enteredText;
        });
      }
    } else {
      // Show a message indicating that the video needs to be uploaded first
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please upload the video first')),
      );
    }
  }

  Future<void> _storeVideoWithText(BuildContext context) async {
    if (_videoUrl.isNotEmpty && _text.isNotEmpty) {
      await FirebaseFirestore.instance.collection('lessons').add({
        'videoUrl': _videoUrl,
        'text': _text,
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Video and text stored successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      // Empty _videoUrl and _text after storing
      setState(() {
        _videoUrl = '';
        _text = '';
      });
    } else {
      // Show a message indicating that both video and text need to be uploaded
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please upload both video and text')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'تعليم',
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Education.png'),
                  fit: BoxFit.fill)),
        ),
        toolbarHeight: 250,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Transform(
              transform: Matrix4.translationValues(120, 0.0, 0.0),
              child: const Text(
                'تسجيل درس',
                style: TextStyle(fontSize: 20),
              )),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buttons(
                context,
                60.0,
                260.0,
                11.0,
                2.0,
                35.0,
                21.0,
                "اضافة درس",
                () {
                  _uploadVideo();
                },
                const Color(0xFF99CFA5),
                const Color(0xFF99CFA5),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buttons(
                context,
                50.0,
                165.0,
                3.0,
                1.0,
                30.0,
                18.0,
                "كتابة نص",
                () {
                  _uploadText();
                },
                const Color(0xFFFFD972),
                const Color(0xFF99CFA5),
              ),
              buttons(
                context,
                50.0,
                165.0,
                3.0,
                1.0,
                30.0,
                18.0,
                "نشر",
                () {
                  _storeVideoWithText(context);
                },
                const Color(0xFFEFA7A7),
                const Color(0xFF99CFA5),
              ),
            ],
          )
        ],
      ),
    );
  }

  GestureDetector buttons(context, height, width, bottom1, left1, bottom2,
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
                      Icon(
                        Icons.upload,
                        color: Colors.black,
                        size: 19,
                      ),
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
}
