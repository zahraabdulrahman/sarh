import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';


class Upload_Sessions extends StatefulWidget {
  const Upload_Sessions({Key? key}) : super(key: key);

  @override
  State<Upload_Sessions> createState() => _Upload_SessionsState();
}

class _Upload_SessionsState extends State<Upload_Sessions> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  Future<void> _saveSession() async {
    final User? user = _auth.currentUser;
    if (user != null && selectedDate != null && selectedTime != null) {
      final sessionsCollection = _firestore.collection('sessions');
      final DateTime dateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedTime!.hour,
        selectedTime!.minute,
      );
      final String formattedTime = DateFormat('h:mm a', 'ar_SA').format(dateTime);
      await sessionsCollection.add({
        'uid': user.uid,
        'date': selectedDate!,
        'time': formattedTime,
      }).then((value) {
        print('Session saved successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Session saved successfully')),
        );
      }).catchError((error) {
        print('Error saving session: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error saving session')),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select date and time')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'صرح',
          style: TextStyle(color: Colors.black, fontSize: 28),
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
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40,),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF99CFA5), // Change the button color here
              ),
              child: const Text('اختر التاريخ', style: TextStyle(color: Colors.black),),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF99CFA5), // Change the button color here
              ),
              child: const Text('اختر الوقت', style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 40,),
            ElevatedButton(
              onPressed: _saveSession,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Change the button color here
              ),
              child: const Text('حفظ الجلسة', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
