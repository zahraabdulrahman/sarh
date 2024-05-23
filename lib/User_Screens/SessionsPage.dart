import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sarh/User_Screens/SpecialistDetails.dart';

import 'SpecialistSession.dart';
//import 'package:flutter/src/rendering/box.dart'; mport 'SecondRoute.dart';

class SessionsPage extends StatefulWidget {
  const SessionsPage({super.key});

  @override
  State<SessionsPage> createState() => _SessionsPage();
}


List<String> selectedCategories = [];
final List<String> gender = ['انثى', 'ذكر'];

class _SessionsPage extends State<SessionsPage> {

  List<Map<String, dynamic>> _foundUsers = [];
  List<Map<String, dynamic>> _allUsers = [];

  @override
  void initState() {
    super.initState();
    // _foundUsers = _allUsers;
    _fetchSpecialists();
  }

  Future<void> _fetchSpecialists() async {
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('specialists').get();

      List<Map<String, dynamic>> fetchedUsers = [];
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;
        if (userData.containsKey('first name') && // Assuming typo correction
            userData.containsKey('major') &&
            userData.containsKey('gender') &&
            userData.containsKey('experience')) {
          fetchedUsers.add(userData);
        }
      });

      setState(() {
        _allUsers = fetchedUsers;
        _foundUsers = _allUsers; // Initially set _foundUsers to all users
      });
    } catch (e) {
      print("Error fetching specialists: $e");
      // Handle error as needed
    }
  }

  void _runFilter(String enteredKeyword, List<String> selectedCategories) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty && selectedCategories.isEmpty) {
      results = _allUsers; // Reset to all users on empty filter
    } else {
      results = _allUsers.where((user) {
        bool nameContainsKeyword =
        user["first name"].toLowerCase().contains(enteredKeyword.toLowerCase());
        bool genderMatchesCategory = selectedCategories.isEmpty ||
            selectedCategories.contains(user["gender"]);
        return nameContainsKeyword && genderMatchesCategory;
      }).toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }

  late String name;
  late String major;
  late String genders;
  late String experience;

  @override
  Widget build(BuildContext context) {
    List<String> selectedCategories = [];
    List<String> gendersList = [
      'انثى',
      'ذكر',
    ];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        //extendBodyBehindAppBar: true, // <-- Set this
        appBar: AppBar(
          title: const Text(
               'جلسات مجدولة',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/صرح.png'),
                    fit: BoxFit.fill)),
          ),
          toolbarHeight: 250,
        ),
        body: Column(
          children: [
            // const Text(
            //   "البحث عن اخصائي",
            //   style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            // ),
            TextField(
              onChanged: (value) => _runFilter(value, selectedCategories),
              decoration: const InputDecoration(
                labelText: 'البحث عن اخصائي',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: gendersList.map((gender) {
                return FilterChip(
                  label: Text(gender),
                  selected: selectedCategories.contains(gender),
                  // selectedColor: Colors.red,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedCategories.add(gender);
                      } else {
                        // Don't remove, just deselect
                      }
                    });
                    _runFilter('', selectedCategories.toList()); // Convert set to list for _runFilter
                  },
                );
              }).toList(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: _foundUsers.length,
                  itemBuilder: (context, index) => GestureDetector(
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 300,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey[
                                300], // You can adjust the shade of grey as needed
                                borderRadius: BorderRadius.circular(
                                    8), // Optional: Adds rounded corners
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    _foundUsers[index]['first name'].toString(),
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  Text(
                                    _foundUsers[index]['major'].toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    _foundUsers[index]["gender"].toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),Text(
                                    _foundUsers[index]["experience"].toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),

                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color.fromARGB(255, 167, 232, 189),
                                  border: Border.all(
                                    color: Colors.grey.shade300, // Border color
                                    width: 1,
                                  ),
                                ),
                                child: const Icon(Icons.person_2_outlined),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SpecialistSession(
                            experience: _foundUsers[index]['experience'].toString(),
                            name: _foundUsers[index]['first name'],
                            major: _foundUsers[index]['major'],
                            genders: _foundUsers[index]["gender"],
                            uid: _foundUsers[index]['uid'],
                          )),
                        );
                      }
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
