import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sarh/SpecialistScreens/Sarh.dart';
import 'package:file_picker/file_picker.dart';
import '../reusable_widgets/reusable_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';

class recordVideos extends StatefulWidget {
  const recordVideos({super.key});

  @override
  State<recordVideos> createState() => _recordVideosState();
}

class _recordVideosState extends State<recordVideos> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _specialistId = ''; // Store specialist ID (if applicable)
  String _videoUrl = '';
  String _text = '';

  Future<void> _uploadVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      final videoRef = _storage.ref().child('videos/$_specialistId/${file.name}'); // Include specialist ID in path
      final uploadTask = videoRef.putFile(File(file.path!));

      await uploadTask.whenComplete(() async {
        final videoUrl = await videoRef.getDownloadURL();
        setState(() {
          _videoUrl = videoUrl;
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
                onPressed: () => Navigator.pop(context, _text),
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
      await _firestore.collection('lessons').add({
        'specialistId': _specialistId, // Store specialist ID for access control
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
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
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
              buttons2(
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
              buttons2(
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
              buttons2(
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
}
