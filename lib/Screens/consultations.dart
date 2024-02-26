import 'package:flutter/material.dart';
//import 'package:flutter/src/rendering/box.dart'; mport 'SecondRoute.dart';

class Consulations extends StatefulWidget {
  const Consulations({super.key});

  @override
  State<Consulations> createState() => _Consulations();
}

bool isDark = false;

class videos extends StatelessWidget {
  const videos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class _Consulations extends State<Consulations> {
  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": "1",
      "الاسم": "الاخصائي: احمد الحمداني",
      "التخصص": "اضطرابات نطق سمعي",
      "الجنس": "ذكر"
    },
    {
      "id": "2",
      "الاسم": "سارة خالد",
      "التخصص": "الاخصائي: اضطرابات نطق سمعي",
      "الجنس": "انثى"
    },
    {
      "id": "2",
      "الاسم": "الاخصائي: الزهراءعبدالرحمن",
      "التخصص": "اضطرابات نطق سمعي",
      "الجنس": "انثى"
    },
    {
      "id": "3",
      "الاسم": "الاخصائي: رنا عبدالعزيز",
      "التخصص": "اضطرابات نطق سمعي",
      "الجنس": "انثى"
    },
    {
      "id": "4",
      "الاسم": ": الاخصائياحمد عبدالله",
      "التخصص": "اضطرابات نطق سمعي",
      "الجنس": "ذكر"
    },
    {
      "id": "5",
      "الاسم": "الاخصائي: خالد ناصر",
      "التخصص": "اضطرابات نطق سمعي",
      "الجنس": "ذكر"
    },
    {
      "id": "6",
      "الاسم": "الاخصائي: صالح عبدالله",
      "التخصص": "اضطرابات نطق سمعي",
      "الجنس": "ذكر"
    },
    {
      "id": "7",
      "الاسم": "الاخصائي: ريم ابراهيم",
      "التخصص": "اضطرابات نطق سمعي",
      "الجنس": "انثى"
    },
    {
      "id": "8",
      "الاسم": "الاخصائي: عبدالمجيد",
      "التخصص": "اضطرابات نطق سمعي",
      "الجنس": "ذكر"
    },
    {
      "id": "9",
      "الاسم": "سمية",
      "التخصص": "الاخصائي: اضطرابات نطق سمعي",
      "الجنس": "انثى"
    },
    {
      "id": "10",
      "الاسم": "الاخصائي: حصه الراشد",
      "التخصص": "اضطرابات نطق سمعي",
      "الجنس": "انثى"
    },
  ];

  List<Map<String, dynamic>> _foundUsers = [];
  @override
  void initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["الاسم"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
  void setState() {
    _foundUsers = results;
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true, // <-- Set this
      appBar: AppBar(
        title: Transform(
          transform: Matrix4.translationValues(150, 43, 0.0),
          child: const Text(
            'استشارات فورية',
            style: TextStyle(color: Colors.black, fontSize: 28),
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
          Row(
            children: [
              Container(
                child: Transform(
                  transform: Matrix4.translationValues(240, -3, 0.0),
                  child: const Text(
                    "البحث عن اخصائي",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),

          TextField(
            onChanged: (value) => _runFilter(value),
            decoration: const InputDecoration(
                labelText: 'البحث عن اخصائي', suffixIcon: Icon(Icons.search)),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: _foundUsers.length,
                  itemBuilder: (context, index) => Card(
                    key: ValueKey(_foundUsers[index]["id"]),
                    color: Colors.grey.shade400,
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                        leading: Text(
                          _foundUsers[index]['الاسم'],
                          style: const TextStyle(
                              fontSize: 24, color: Colors.black),
                        ),
                        title: Text(
                          _foundUsers[index]['التخصص'],
                          style: const TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(
                          _foundUsers[index]["الجنس"],
                          style: const TextStyle(color: Colors.black),
                        )),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
