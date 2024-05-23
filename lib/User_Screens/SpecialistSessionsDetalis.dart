import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sarh/User_Screens/PaymentPage.dart';
import 'package:sarh/User_Screens/consultations.dart';
import '../reusable_widgets/reusable_widget.dart';

class SpecialistSessionsDetalis extends StatefulWidget {
  final String name;
  final String major;
  final String genders;
  final String experience;
  final String uid;
  final String time;
  final date;

  const SpecialistSessionsDetalis({
    super.key,
    required this.name,
    required this.major,
    required this.genders,
    required this.experience,
    required this.uid,
    required this.time,
    required this.date,
  });

  @override
  State<SpecialistSessionsDetalis> createState() => _SpecialistSessionsDetalisState();
}

class _SpecialistSessionsDetalisState extends State<SpecialistSessionsDetalis> {

  String getCurrentUserUID() {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.uid ?? '';
  }

  Future<bool> checkExistingReservation(String userUID, String specialistUID, String sessoinTime) async {
    if (userUID.isNotEmpty && specialistUID.isNotEmpty) {
      try {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('reservations')
            .where('user_uid', isEqualTo: userUID)
            .where('consultation_time', isEqualTo: sessoinTime)
            .get();

        return querySnapshot.docs.isNotEmpty;
      } catch (e) {
        print('Error checking reservation: $e');
        return false;
      }
    }
    return false;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
           'حجز جلسة',
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
          Stack(
            children: [
              Container(
                width: 400,
                height: 300,
                margin: const EdgeInsets.symmetric(horizontal: 18,vertical: 20),
                decoration: BoxDecoration(
                  color: Colors
                      .grey[300], // You can adjust the shade of grey as needed
                  borderRadius:
                  BorderRadius.circular(8), // Optional: Adds rounded corners
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 40,),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              widget.name,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                            ),
                            Text(
                              widget.major,
                              style: const TextStyle(color: Colors.black),
                            ),
                            Text(
                              widget.genders,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          'نوع الجلسات:\n'
                              'مخاطبة',
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        Text(
                          'الخبرة:\n'
                              '${widget.experience} سنوات',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Text(
                          'تقديم الجلسات:\n'
                              'صوتية',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Text(
                          'اللغة:\n'
                              'العربية',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const Row(
                      children: [
                        Text(
                          '150رس/45د',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 10,
                child: Container(
                  width: 60,
                  height: 60,
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

              return Transform(
                transform: Matrix4.translationValues(-50, 0, 0),
                child: buttons(
                  context,
                  58.0,
                  220.0,
                  "الدفع",
                      () async {
                    String userUID = getCurrentUserUID();

                    if (userUID.isEmpty) {
                      print('Error: User UID is empty');
                      return;
                    }

                    bool hasExistingReservation = await checkExistingReservation(userUID, widget.uid, widget.time);

                    if (hasExistingReservation) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('يوجد لديك جلسة في نفس الوقت!'),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PaymentPage()),
                      );
                      String specialistUID = widget.uid;
                      DateTime now = DateTime.now();
                      String formattedDate = DateFormat('yyyy-MM-dd').format(now);
                      String currentTime = DateFormat('HH:mm').format(now);
                      Map<String, dynamic> consultationData = {
                        'user_uid': userUID,
                        'specialist_uid': specialistUID,
                        'consultation_date': widget.date,
                        'consultation_time': widget.time,
                        'call_duration': 45,
                        'incoming': true,
                      };

                      try {
                        await FirebaseFirestore.instance.collection('reservations').add(consultationData);
                        setState(() {
                          // Update reservation status if needed
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('تم حجز الجلسة بنجاح!'),
                          ),
                        );
                      } catch (e) {
                        print('Error making reservation: $e');
                      }
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),

    );
  }
}
