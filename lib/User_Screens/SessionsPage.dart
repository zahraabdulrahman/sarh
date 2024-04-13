import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore package

class SessionsPage extends StatefulWidget {
  const SessionsPage({Key? key});

  @override
  State<SessionsPage> createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  List<Map<String, dynamic>> _foundUsers = [];

  @override
  void initState() {
    _fetchSpecialists(); // Call method to fetch data from Firestore
    super.initState();
  }

  Future<void> _fetchSpecialists() async {
    try {
      // Fetch data from Firestore 'specialists' collection
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('specialists').get();

      List<Map<String, dynamic>> fetchedUsers = [];
      querySnapshot.docs.forEach((doc) {
        fetchedUsers.add(doc.data() as Map<String, dynamic>);
      });

      setState(() {
        _foundUsers = fetchedUsers;
      });
    } catch (e) {
      print("Error fetching specialists: $e");
      // Handle error as needed
    }
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _foundUsers;
    } else {
      results = _foundUsers
          .where((user) =>
          user["الاسم"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('جلسات مجدولة'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) => _runFilter(value),
            decoration: const InputDecoration(
              labelText: 'البحث عن اخصائي',
              suffixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundUsers[index]["uid"]),
                  color: Colors.grey.shade400,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    title: Text(
                      _foundUsers[index]['first name'] +
                          ' ' +
                          _foundUsers[index]['last name'],
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      _foundUsers[index]['major'],
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
