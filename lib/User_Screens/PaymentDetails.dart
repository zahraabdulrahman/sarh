import 'package:flutter/material.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
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
          'الدفع',
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
          Transform(
            transform: Matrix4.translationValues(0, -50, 0),
            child: Image.asset(
              'assets/images/madaCard.png',
              width: 250,
              height: 250,
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(0, -80, 0),
            child: const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
              child: Row(
                children: [
                  Text('تفاصيل البطاقه', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(0, -75, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 255,
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16.0),
                      labelText: 'رقم البطاقه',
                    ),
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Transform(
            transform: Matrix4.translationValues(0, -75, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 122.5,
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16.0),
                      labelText: 'تاريخ الانتهاء',
                    ),
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 122.5,
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16.0),
                      labelText: 'VCC',
                    ),
                    style: const TextStyle(
                        fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Transform(
            transform: Matrix4.translationValues(0, -75, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 255,
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16.0),
                      labelText: 'الاسم',
                    ),
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(0, -60, 0),
            child: Container(
              height: 35,
              width: 180,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green.shade300, Colors.lightGreen],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton(
                style: const ButtonStyle(),
                onPressed: () {},
                child: const Text(
                  'دفع',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

