import 'dart:html';

import 'package:flutter/material.dart';
import 'User_Settings.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class CardsSettings extends StatefulWidget {
  const CardsSettings({super.key});

  @override
  State<CardsSettings> createState() => _CardsSettingsState();
}

class _CardsSettingsState extends State<CardsSettings> {



  // Future<void> _saveImageToAssets(String imagePath) async {
  //   // Your save logic here
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Center(
            child: Expanded(
              child: Column(children: [
                Row(children: [
                  Transform(
                    transform: Matrix4.translationValues(-10, 0.0, 0.0),
                    child: const Icon(Icons.auto_awesome_motion_outlined),
                  ),
                  GestureDetector(
                      child: const Text(
                        "     اعدادات البطاقات ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const User_Settings()),
                        );
                      }),
                  Transform(
                    transform: Matrix4.translationValues(-250, 0.0, 0.0),
                    child: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                      size: 19,
                    ),
                  ),
                ]),
                const Divider(
                  color: Color.fromARGB(255, 239, 167, 167),
                  thickness: 5,
                  indent: 7,
                  endIndent: 150,
                ),
              ]),
            ),
          ),
        ));
  }
}
