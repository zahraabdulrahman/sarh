import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: const Text(
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
          Align(alignment: Alignment.centerRight,
              child: Text("المرحلة:",style: TextStyle(fontSize: 28),textDirection: TextDirection.rtl,)),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // Number of columns in the grid
              crossAxisSpacing: 10, // Spacing between columns horizontally
              mainAxisSpacing: 10, // Spacing between rows vertically
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFEFA7A7), // Replace with your desired icon color
                    ),
                    child: Text("١", style: TextStyle(fontSize: 68)),
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFC7EAE4),
                    ),
                    child: Text("٢", style: TextStyle(fontSize: 68)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFA7E8BD),
                    ),
                    child: Text("٣", style: TextStyle(fontSize: 68)),
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFD972),
                    ),
                    child: Text("٤", style: TextStyle(fontSize: 68)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFEFA7A7), // Replace with your desired icon color
                    ),
                    child: Text("٥", style: TextStyle(fontSize: 68)),
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFC7EAE4),
                    ),
                    child: Text("٦", style: TextStyle(fontSize: 68)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFA7E8BD),
                    ),
                    child: Text("٧", style: TextStyle(fontSize: 68)),
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFD972),
                    ),
                    child: Text("٨", style: TextStyle(fontSize: 68)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFEFA7A7), // Replace with your desired icon color
                    ),
                    child: Text("٩", style: TextStyle(fontSize: 68)),
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFC7EAE4),
                    ),
                    child: Text("١٠", style: TextStyle(fontSize: 68)),
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