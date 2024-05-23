import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sarh/User_Screens/SpecialistSessionsDetalis.dart';

class SpecialistSession extends StatefulWidget {
  const SpecialistSession({
    Key? key,
    required this.experience,
    required this.name,
    required this.major,
    required this.genders,
    required this.uid,
  }) : super(key: key);

  final String experience;
  final String name;
  final String major;
  final String genders;
  final String uid;

  @override
  State<SpecialistSession> createState() => _SpecialistSessionState();
}

class _SpecialistSessionState extends State<SpecialistSession> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> _sessions = [];

  Future<void> _fetchSessions() async {
    try {
      final QuerySnapshot sessionsSnapshot = await _firestore
          .collection('sessions')
          .where('uid', isEqualTo: widget.uid)
          .get();

      _sessions = sessionsSnapshot.docs;

      setState(() {}); // Update the UI with fetched sessions
    } catch (e) {
      print('Error fetching sessions: $e');
      // Handle error
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchSessions(); // Fetch sessions when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          child: Transform(
            transform: Matrix4.translationValues(-10, 43, 0.0),
            child: const Text(
              'صرح',
              style: TextStyle(color: Colors.black, fontSize: 28),
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/صرح.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        toolbarHeight: 250,
      ),
      body: _sessions.isNotEmpty
          ? GridView.builder(
        itemCount: _sessions.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns in the grid
          mainAxisSpacing: 10.0, // Spacing between items vertically
          crossAxisSpacing: 10.0, // Spacing between items horizontally
        ),
        itemBuilder: (context, index) {
          final session = _sessions[index];
          return Card(
            child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SpecialistSessionsDetalis(
                        time: _sessions[index]['time'],
                        date: _sessions[index]['date'],
                        experience: widget.experience,
                        name: widget.name,
                        major: widget.major,
                        genders: widget.genders,
                        uid: widget.uid,
                      )),
                    );
                  },
              child: ListTile(
                    title: Center(child: Text('${session['time']}')),
                    // Add more session information as needed
                  ),
            ),
          );
        },
      )
          : const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
