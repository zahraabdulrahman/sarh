import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../User_Screens/PersonalInformation.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Uint8List? _image;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: SafeArea(
          child: Center(
            child: Expanded(
              child: Column(children: [
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
                  height: 40,
                ),
                FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: FirebaseFirestore.instance
                      .collection('specialists')
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
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 150,
                            height: 20,
                            child: TextField(
                              controller:
                              controller, // Set the controller for the TextField
                              decoration: InputDecoration(
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
                                  12), // Style for the text in the TextField
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                // Update the data when the TextField value changes
                                data['first name'] = value;

                                // Update Firestore with the new data
                                FirebaseFirestore.instance
                                    .collection('specialists')
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
                  height: 15,
                ),
                FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: FirebaseFirestore.instance
                      .collection('specialists')
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
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 150,
                            height: 20,
                            child: TextField(
                              controller:
                              controller, // Set the controller for the TextField
                              decoration: InputDecoration(
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
                                  12), // Style for the text in the TextField
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                // Update the data when the TextField value changes
                                data['last name'] = value;

                                // Update Firestore with the new data
                                FirebaseFirestore.instance
                                    .collection('specialists')
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
                  height: 15,
                ),
                FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: FirebaseFirestore.instance
                      .collection('specialists')
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
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 160,
                            height: 20,
                            child: TextField(
                              controller:
                              controller, // Set the controller for the TextField
                              decoration: InputDecoration(
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
                                  12), // Style for the text in the TextField
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                // Update the data when the TextField value changes
                                data['email'] = value;

                                // Update Firestore with the new data
                                FirebaseFirestore.instance
                                    .collection('specialists')
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
                ),
                const SizedBox(
                  height: 15,
                ),
                FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: FirebaseFirestore.instance
                      .collection('specialists')
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
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 160,
                            height: 20,
                            child: TextField(
                              controller:
                              controller, // Set the controller for the TextField
                              decoration: InputDecoration(
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
                                  12), // Style for the text in the TextField
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                // Update the data when the TextField value changes
                                data['date'] = value;

                                // Update Firestore with the new data
                                FirebaseFirestore.instance
                                    .collection('specialists')
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
                const SizedBox(
                  height: 15,
                ),
                FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: FirebaseFirestore.instance
                      .collection('specialists')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .get(),
                  builder: (_, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error = ${snapshot.error}');
                    }
                    Map<String, dynamic> data = snapshot.data!.data()!;
                    TextEditingController controller = TextEditingController(
                        text: data[
                        'experience'].toString()); // Create a TextEditingController
                    return Transform(
                      transform: Matrix4.translationValues(-10, 0.0, 0.0),
                      child: Row(
                        children: [
                          const Text(
                            'سنوات الخبرة : ',
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            width: 160,
                            height: 20,
                            child: TextField(
                              controller:
                              controller, // Set the controller for the TextField
                              decoration: InputDecoration(
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
                                  12), // Style for the text in the TextField
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                // Update the data when the TextField value changes
                                data['experience'] = value;

                                // Update Firestore with the new data
                                FirebaseFirestore.instance
                                    .collection('specialists')
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .update({'experience': value})
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
                const SizedBox(
                  height: 15,
                ),
                FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: FirebaseFirestore.instance
                      .collection('specialists')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .get(),
                  builder: (_, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error = ${snapshot.error}');
                    }
                    Map<String, dynamic> data = snapshot.data!.data()!;
                    TextEditingController controller = TextEditingController(
                        text: data[
                        'major']); // Create a TextEditingController
                    return Transform(
                      transform: Matrix4.translationValues(-10, 0.0, 0.0),
                      child: Row(
                        children: [
                          const Text(
                            'التخصص: ',
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 160,
                            height: 20,
                            child: TextField(
                              controller:
                              controller, // Set the controller for the TextField
                              decoration: InputDecoration(
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
                                  12), // Style for the text in the TextField
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                // Update the data when the TextField value changes
                                data['major'] = value;

                                // Update Firestore with the new data
                                FirebaseFirestore.instance
                                    .collection('specialists')
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .update({'major': value})
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
                ),const SizedBox(
                  height: 15,
                ),
                FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: FirebaseFirestore.instance
                      .collection('specialists')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .get(),
                  builder: (_, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error = ${snapshot.error}');
                    }
                    Map<String, dynamic> data = snapshot.data!.data()!;
                    TextEditingController controller = TextEditingController(
                        text: data[
                        'gender']); // Create a TextEditingController
                    return Transform(
                      transform: Matrix4.translationValues(-10, 0.0, 0.0),
                      child: Row(
                        children: [
                          const Text(
                            'الجنس: ',
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 160,
                            height: 20,
                            child: TextField(
                              controller:
                              controller, // Set the controller for the TextField
                              decoration: InputDecoration(
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
                                  12), // Style for the text in the TextField
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                // Update the data when the TextField value changes
                                data['gender'] = value;

                                // Update Firestore with the new data
                                FirebaseFirestore.instance
                                    .collection('specialists')
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .update({'gender': value})
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
