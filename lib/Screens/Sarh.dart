import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/rendering/box.dart';
import 'package:flutter/cupertino.dart';
import 'consultations.dart';
import 'SessionsPage.dart';

class Sarh extends StatefulWidget {
  const Sarh({super.key});

  @override
  State<Sarh> createState() => _Sarh();
}

class _Sarh extends State<Sarh> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true, // <-- Set this
      appBar: AppBar(
        title: SizedBox(
          child: Transform(
            transform: Matrix4.translationValues(280, 43, 0.0),
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
                  fit: BoxFit.fill)),
        ),
        toolbarHeight: 250,
      ),
      body: Column(
        children: [
          FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .get(),
            builder: (_, snapshot) {
              if (snapshot.hasError) return Text('Error = ${snapshot.error}');
              Map<String, dynamic> data = snapshot.data!.data()!;
              String firstName =
                  data['first name'] ?? ''; // Get the first name from data

              return SizedBox(
                child: Transform(
                  transform: Matrix4.translationValues(265, -5, 0.0),
                  child: Row(
                    children: [
                      Text(
                        '$firstName اهلاً  ',
                        style:
                            const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Row(
            children: [
              Container(
                child: SizedBox(
                  child: Transform(
                    transform: Matrix4.translationValues(296, -8, 0),
                    child: const Text("الدروس"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    width: 100,
                    color: Colors.grey[400],
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Item $index',
                      style: const TextStyle(fontSize: 24),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 80,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    width: 100,
                    color: Colors.grey[400],
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Item $index',
                      style: const TextStyle(fontSize: 24),
                    ),
                  );
                },
              ),
            ),
          ),
          const Divider(color: Color.fromARGB(255, 216, 188, 128)),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.amber.shade100),
                height: 60,
                width: 250,
                child: CupertinoButton(
                  child: const Text(
                    'استشارات فورية',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const Consulations()),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.amber.shade100),
                height: 60,
                width: 250,
                child: CupertinoButton(
                  child: const Text(
                    'جلسات مجدولة',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SessionsPage()),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
