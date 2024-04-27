import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:sarh/services/CallPage.dart';
import 'dart:async';

class Specialist_dates extends StatefulWidget {
  const Specialist_dates({super.key});

  @override
  State<Specialist_dates> createState() => _Specialist_datesState();
}

class _Specialist_datesState extends State<Specialist_dates> {
  Timer? reservationTimer;
  Timer? callAvailableTimer;
  String userUID = '';
  late String specialistUID;
  late String formattedDate;
  late String formattedTime;
  late String callDuration;
  String channelIdd = '';
  late bool callAvailable = false;

  @override
  void initState() {
    super.initState();
    startReservationTimer();
  }

  @override
  void dispose() {
    callAvailableTimer?.cancel();
    reservationTimer?.cancel();
    super.dispose();
  }

  void startReservationTimer() {
    // Start the timer to check for reservations every 1 minute
    reservationTimer?.cancel();
    reservationTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
      fetchReservationDetails();
      print("working");
    });
  }

  void fetchReservationDetails() async {
    User? user = FirebaseAuth.instance.currentUser;
    DateTime now = DateTime.now();
    String currentDate = DateFormat('yyyy-MM-dd').format(now);
    String currentTime = DateFormat('HH:mm').format(now);

    // Fetch relevant reservations from Firestore
    QuerySnapshot reservationQuerySnapshot = await FirebaseFirestore.instance
        .collection('reservations')
        .where('incoming', isEqualTo: true)
        .where('consultation_date', isEqualTo: currentDate)
        .where('consultation_time', isEqualTo: currentTime)
        .where(
        'specialist_uid', isEqualTo: user?.uid) // Use user?.uid instead of user
        .get();

    List<QueryDocumentSnapshot> reservationSnapshots =
        reservationQuerySnapshot.docs;

    // Process each reservation
    for (QueryDocumentSnapshot reservationSnapshot in reservationSnapshots) {
      channelIdd = reservationSnapshot.id; // Save document ID as channelId
      Map<String, dynamic> reservationData = reservationSnapshot.data()
      as Map<String, dynamic>;

      // Extract relevant information
      userUID = reservationData['user_uid'];
      specialistUID = reservationData['specialist_uid'];
      formattedDate = reservationData['consultation_date'];
      formattedTime = reservationData['consultation_time'];

      setState(() {
        callAvailable = reservationData['incoming'] ??
            false; // Set default value if incoming is null
        print(callAvailable);
        print(formattedDate);

        if (callAvailable) {
          // Cancel the previous timer if it exists
          callAvailableTimer?.cancel();

          // Start a new timer to set callAvailable to false after 5 minutes
          callAvailableTimer = Timer(const Duration(minutes: 5), () {
            setState(() {
              callAvailable = false;
            });
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String channelId = channelIdd;
    String userIdd = userUID;
    return Scaffold(
      appBar: AppBar(
        title: Transform(
          transform: Matrix4.translationValues(280, 43, 0.0),
          child: const Text(
            'مواعيدي',
            style: TextStyle(color: Colors.black, fontSize: 28),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/dates.png'),
                  fit: BoxFit.fill)),
        ),
        toolbarHeight: 250,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                child: Transform(
                  transform: Matrix4.translationValues(280, -3, 0.0),
                  child: const Text(
                    "الدخول للجلسة",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Center(
              child: callAvailable
                  ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color.fromARGB(255, 167, 232, 189),
                ),
                height: 60,
                width: 250,
                child: CupertinoButton(
                  child: const Text(
                    'الجلسة المتاحة',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    if (channelIdd.isNotEmpty && userIdd.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CallPage(channelId: channelIdd, userId: userIdd,)),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error: Channel ID is empty.'),
                        ),
                      );
                    }
                  },
                ),
              )
                  : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey,
                ),
                height: 60,
                width: 250,
                child: Center(
                  child: const Text(
                    'الجلسة المتاحة',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                  child: Transform(
                    transform: Matrix4.translationValues(280, -3, 0.0),
                    child: const Text(
                      "المواعيد القادمة",
                      style:
                      TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: Colors.grey.shade400),
                    alignment: Alignment.center,
                    width: 260,
                    height: 130,
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  child: Transform(
                    transform: Matrix4.translationValues(280, -3, 0.0),
                    child: const Text(
                      "المواعيدالسابقة",
                      style:
                      TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: Colors.grey.shade400),
                    alignment: Alignment.center,
                    width: 260,
                    height: 130,
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
        ],
      ),
    );
  }
}
