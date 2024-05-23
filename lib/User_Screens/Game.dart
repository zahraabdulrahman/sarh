import 'package:flutter/material.dart';
import 'package:sarh/User_Screens/FirstLevel.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'اللعب',
            style: TextStyle(color: Colors.black, fontSize: 28),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Group 89.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        toolbarHeight: 250,
      ),
      body: Column(
        children: [
          const Align(alignment: Alignment.centerRight,
              child: Text("المرحلة:",style: TextStyle(fontSize: 28),textDirection: TextDirection.rtl,)),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // Number of columns in the grid
              crossAxisSpacing: 10, // Spacing between columns horizontally
              mainAxisSpacing: 10, // Spacing between rows vertically
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FirstLevel(),
                        ),
                      );
                    },child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFEFA7A7), // Replace with your desired icon color
                    ),
                    child: const Text("١", style: TextStyle(fontSize: 68)),
                  ),
                )
                ),
                const SizedBox(height: 30,),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFC7EAE4),
                    ),
                    child: const Text("٢", style: TextStyle(fontSize: 68)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFA7E8BD),
                    ),
                    child: const Text("٣", style: TextStyle(fontSize: 68)),
                  ),
                ),
                const SizedBox(height: 30,),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFD972),
                    ),
                    child: const Text("٤", style: TextStyle(fontSize: 68)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFEFA7A7), // Replace with your desired icon color
                    ),
                    child: const Text("٥", style: TextStyle(fontSize: 68)),
                  ),
                ),
                const SizedBox(height: 30,),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFC7EAE4),
                    ),
                    child: const Text("٦", style: TextStyle(fontSize: 68)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFA7E8BD),
                    ),
                    child: const Text("٧", style: TextStyle(fontSize: 68)),
                  ),
                ),
                const SizedBox(height: 30,),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFD972),
                    ),
                    child: const Text("٨", style: TextStyle(fontSize: 68)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFEFA7A7), // Replace with your desired icon color
                    ),
                    child: const Text("٩", style: TextStyle(fontSize: 68)),
                  ),
                ),
                const SizedBox(height: 30,),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFC7EAE4),
                    ),
                    child: const Text("١٠", style: TextStyle(fontSize: 68)),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );

  }
}