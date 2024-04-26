import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/material/dropdown.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Expanded(
            child: Column(children: [
              SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIwRBD9gNuA2GjcOf6mpL-WuBhJADTWC3QVQ&usqp=CAU'),
                        ),
                  const Positioned(
                    bottom: -15,
                    left: 50,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
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
                      text:
                          data['first name']); // Create a TextEditingController
                  return Center(
                    child: SizedBox(
                      width: 255,
                      height: 30,
                      child: TextField(
                        controller:
                            controller, // Set the controller for the TextField
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ), // Border for the TextField
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                          labelText: 'الاسم الاول',
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
                              .then((_) => print('Name updated successfully'))
                              .catchError((error) =>
                                  print('Failed to update name: $error'));
                        },
                      ),
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
                      text:
                          data['last name']); // Create a TextEditingController
                  return Center(
                    child: SizedBox(
                      width: 255,
                      height: 30,
                      child: TextField(
                        controller:
                            controller, // Set the controller for the TextField
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ), // Border for the TextField
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                          labelText: 'الاسم الاخير',
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
                              .then((_) => print('Name updated successfully'))
                              .catchError((error) =>
                                  print('Failed to update name: $error'));
                        },
                      ),
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
                      text: data['email']); // Create a TextEditingController
                  return Center(
                    child: SizedBox(
                      width: 255,
                      height: 30,
                      child: TextField(
                        controller:
                            controller, // Set the controller for the TextField
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ), // Border for the TextField
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                          labelText: 'البريد الالكتروني',
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
                              .then((_) => print('Email updated successfully'))
                              .catchError((error) =>
                                  print('Failed to update Email: $error'));
                        },
                      ),
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
                      text: data['date']); // Create a TextEditingController
                  return Center(
                    child: SizedBox(
                      width: 255,
                      height: 30,
                      child: TextField(
                        readOnly: true, // Make the TextField read-only
                        controller: controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ), // Border for the TextField
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                          labelText: 'تاريخ الميلاد',
                        ),
                        style: const TextStyle(
                            fontSize:
                                12), // Style for the text in the TextField
                        textAlign: TextAlign.center,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(DateTime.now().year - 65, 1,
                                1), // 50 years ago from today
                            lastDate: DateTime(DateTime.now().year - 20, 12,
                                31), // 7 years ago from today (Dec 31st)
                          );

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            controller.text = formattedDate;
                            data['date'] = formattedDate;

                            // Update Firestore with the new date
                            FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({'date': formattedDate})
                                .then((_) => print('Date updated successfully'))
                                .catchError((error) =>
                                    print('Failed to update Date: $error'));
                          }
                        },
                      ),
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
                  String selectedExperience = data['experience']
                      .toString()
                      .toLowerCase(); // Ensure lowercase match
                  List<String> experienceOptions = [
                    '1',
                    '2',
                    '3',
                    '4',
                    '5',
                    'اكثر من 5'
                  ]; // Remove duplicates

                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'سنوات الخبرة : ',
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 30,
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(
                                color: Colors.black,
                                width: 1.0), // Border around the menu
                            borderRadius:
                                BorderRadius.circular(20.0), // Rounded corners
                          ),
                          child: DropdownButton<String>(
                            value: selectedExperience,
                            onChanged: (newValue) {
                              setState(() {
                                selectedExperience = newValue!;
                                data['experience'] = newValue;

                                // Update Firestore with the new data
                                FirebaseFirestore.instance
                                    .collection('specialists')
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .update({'experience': newValue})
                                    .then((_) => print(
                                        'Experience updated successfully'))
                                    .catchError((error) => print(
                                        'Failed to update Experience: $error'));
                              });
                            },
                            items: experienceOptions.map((String option) {
                              return DropdownMenuItem<String>(
                                value: option
                                    .toLowerCase(), // Ensure lowercase value
                                child: Text(
                                  option,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              );
                            }).toList(),
                            underline: Container(),
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

                  // Replace with your actual list of majors retrieved from Firestore
                  List<String> majorOptions = [
                    'اضطرابات',
                    'أخصائي أمراض واضطرابات اللغة',
                    'أخصائي أمراض واضطرابات الكلام',
                    'أخصائي أمراض النطق واللغة والسمع '
                  ]; // Example

                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'التخصص: ',
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 30,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(color: Colors.black, width: 1.0), // Border around the menu
                            borderRadius: BorderRadius.circular(20.0), // Rounded corners
                          ),
                          child: DropdownButton<String>(
                            value: data['major']?.toString() ??
                                "", // Set initial value
                            onChanged: (newValue) {
                              setState(() {
                                data['major'] = newValue!;
                                // Update Firestore with the new data
                                FirebaseFirestore.instance
                                    .collection('specialists')
                                    .doc(FirebaseAuth.instance.currentUser!.uid)
                                    .update({'major': newValue})
                                    .then((_) =>
                                        print('Major updated successfully'))
                                    .catchError((error) =>
                                        print('Failed to update Major: $error'));
                              });
                            },
                            items: majorOptions.map((String option) {
                              return DropdownMenuItem<String>(
                                value: option.toLowerCase(),
                                child: Text(option, style: TextStyle(fontSize: 12),),
                              );
                            }).toList(),
                            underline: Container(),
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

                  List<String> genderOptions = [
                    'ذكر',
                    'أنثى'
                  ]; // Gender options

                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'الجنس: ',
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 30,
                          padding: const EdgeInsets.symmetric(horizontal: 55),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(color: Colors.black, width: 1.0), // Border around the menu
                            borderRadius: BorderRadius.circular(20.0), // Rounded corners
                          ),
                          child: DropdownButton<String>(
                            value: data['gender']
                                ?.toString(), // Check for null before conversion
                            onChanged: (newValue) {
                              setState(() {
                                data['gender'] = newValue;
                                // Update Firestore with the new data
                                if (newValue != null) {
                                  // Update only if a value is selected
                                  FirebaseFirestore.instance
                                      .collection('specialists')
                                      .doc(FirebaseAuth.instance.currentUser!.uid)
                                      .update({'gender': newValue})
                                      .then((_) =>
                                          print('Gender updated successfully'))
                                      .catchError((error) => print(
                                          'Failed to update Gender: $error'));
                                }
                              });
                            },
                            items: [
                              // Add an empty option for default null value
                              const DropdownMenuItem<String>(
                                value: null,
                                child: Text(
                                    'اختر الجنس'), // Customize the text for null option
                              ),
                              ...genderOptions.map((String option) {
                                return DropdownMenuItem<String>(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList(),
                            ],
                            underline: Container(),
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
    );
  }
}
