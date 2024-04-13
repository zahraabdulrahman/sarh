import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sarh/User_Screens/consultations.dart';

class DatesPage extends StatelessWidget {
  const DatesPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color.fromARGB(255,167,232,189)
                ),
                height: 60,
                width: 250,
                child: CupertinoButton(
                  child: const Text('الجلسة المتاحة', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20),),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Consulations()),
                    );
                  },
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
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
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
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
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
