import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../reusable_widgets/reusable_widget.dart';
import 'User_Settings.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

Uint8List? _image;
void selectImage() async {
  Uint8List img = await pickImage(ImageSource.gallery);
  _image = img;
}

class _PersonalInformationState extends State<PersonalInformation> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Center(
            child: Expanded(
              child: Column(children: [
                Row(children: [
                  Transform(
                    transform: Matrix4.translationValues(-10, 0.0, 0.0),
                    child: const Icon(Icons.chat_bubble_outline_rounded),
                  ),
                  GestureDetector(
                      child: const Text(
                        "     البيانات الشخصية ",
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
                    const Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: selectImage,
                        icon: Icon(Icons.add_a_photo),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .get(),
                  builder: (_, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error = ${snapshot.error}');
                    }
                    Map<String, dynamic> data = snapshot.data!.data()!;
                    TextEditingController controller = TextEditingController(
                        text: data[
                            'first name']); // Create a TextEditingController
                    return Transform(
                      transform: Matrix4.translationValues(-10, 0.0, 0.0),
                      child: Row(
                        children: [
                          const Text(
                            'الاسم الاول: ',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 220,
                            height: 50,
                            child: TextField(
                              controller:
                                  controller, // Set the controller for the TextField
                              decoration: InputDecoration(
                                labelText:
                                    'الاسم الاول', // Label for the TextField
                                border:
                                    const OutlineInputBorder(), // Border for the TextField
                                fillColor: Colors.grey.shade400,
                                filled: true,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 16.0),
                                alignLabelWithHint: true,
                              ),
                              style: const TextStyle(
                                  fontSize:
                                      16), // Style for the text in the TextField
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                // Update the data when the TextField value changes
                                data['first name'] = value;

                                // Update Firestore with the new data
                                FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .update({'first name': value})
                                    .then((_) =>
                                        print('Name updated successfully'))
                                    .catchError((error) =>
                                        print('Failed to update name: $error'));
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .get(),
                  builder: (_, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error = ${snapshot.error}');
                    }
                    Map<String, dynamic> data = snapshot.data!.data()!;
                    TextEditingController controller = TextEditingController(
                        text: data[
                            'last name']); // Create a TextEditingController
                    return Transform(
                      transform: Matrix4.translationValues(-10, 0.0, 0.0),
                      child: Row(
                        children: [
                          const Text(
                            'الاسم الاخير: ',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 220,
                            height: 50,
                            child: TextField(
                              controller:
                                  controller, // Set the controller for the TextField
                              decoration: InputDecoration(
                                labelText:
                                    'الاسم الاخير', // Label for the TextField
                                border:
                                    const OutlineInputBorder(), // Border for the TextField
                                fillColor: Colors.grey.shade400,
                                filled: true,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 16.0),
                                alignLabelWithHint: true,
                              ),
                              style: const TextStyle(
                                  fontSize:
                                      16), // Style for the text in the TextField
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                // Update the data when the TextField value changes
                                data['last name'] = value;

                                // Update Firestore with the new data
                                FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .update({'last name': value})
                                    .then((_) =>
                                        print('Name updated successfully'))
                                    .catchError((error) =>
                                        print('Failed to update name: $error'));
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),const SizedBox(
                  height: 20,
                ),
                FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .get(),
                  builder: (_, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error = ${snapshot.error}');
                    }
                    Map<String, dynamic> data = snapshot.data!.data()!;
                    TextEditingController controller = TextEditingController(
                        text: data[
                            'email']); // Create a TextEditingController
                    return Transform(
                      transform: Matrix4.translationValues(-10, 0.0, 0.0),
                      child: Row(
                        children: [
                          const Text(
                            'البريد الالكتروني: ',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 220,
                            height: 50,
                            child: TextField(
                              controller:
                                  controller, // Set the controller for the TextField
                              decoration: InputDecoration(
                                labelText:
                                    'البريد الالكتروني', // Label for the TextField
                                border:
                                    const OutlineInputBorder(), // Border for the TextField
                                fillColor: Colors.grey.shade400,
                                filled: true,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 16.0),
                                alignLabelWithHint: true,
                              ),
                              style: const TextStyle(
                                  fontSize:
                                      16), // Style for the text in the TextField
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                // Update the data when the TextField value changes
                                data['email'] = value;

                                // Update Firestore with the new data
                                FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .update({'email': value})
                                    .then((_) =>
                                        print('Email updated successfully'))
                                    .catchError((error) =>
                                        print('Failed to update Email: $error'));
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),const SizedBox(
                  height: 20,
                ),
                FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .get(),
                  builder: (_, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error = ${snapshot.error}');
                    }
                    Map<String, dynamic> data = snapshot.data!.data()!;
                    TextEditingController controller = TextEditingController(
                        text: data[
                            'date']); // Create a TextEditingController
                    return Transform(
                      transform: Matrix4.translationValues(-10, 0.0, 0.0),
                      child: Row(
                        children: [
                          const Text(
                            'تاريخ الميلاد: ',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 220,
                            height: 50,
                            child: TextField(
                              controller:
                                  controller, // Set the controller for the TextField
                              decoration: InputDecoration(
                                labelText:
                                    'تاريخ الميلاد', // Label for the TextField
                                border:
                                    const OutlineInputBorder(), // Border for the TextField
                                fillColor: Colors.grey.shade400,
                                filled: true,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 16.0),
                                alignLabelWithHint: true,
                              ),
                              style: const TextStyle(
                                  fontSize:
                                      16), // Style for the text in the TextField
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                // Update the data when the TextField value changes
                                data['date'] = value;

                                // Update Firestore with the new data
                                FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .update({'date': value})
                                    .then((_) =>
                                        print('Date updated successfully'))
                                    .catchError((error) =>
                                        print('Failed to update Date: $error'));
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
