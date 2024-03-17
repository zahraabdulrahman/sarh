import 'package:flutter/material.dart';
AudioPlayer audioPlayer = AudioPlayer();
// card data
class CardData {
  final String title;
  final String soundFilePath;
  final String photoPath;

  CardData({required this.title, required this.soundFilePath, required this.photoPath});
}

List<CardData> cards = [
  CardData(title: 'Happy', soundFilePath: 'assets/sounds/happy.m4a', photoPath: 'assets/images/happy.png'),
];

class Feelings extends StatelessWidget {
  const Feelings({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Transform(
          transform: Matrix4.translationValues(150, 43, 0.0),
          child: const Text(
            'بطاقات',
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
      body:
      SingleChildScrollView(
          child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: 337,
                        decoration: const BoxDecoration(
                            color: Colors.grey
                        ),

                      )]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                          onPressed: () {
                            // Handle button press
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                              fixedSize: MaterialStateProperty.all<Size>(
                                const Size(73, 50),// Specify the desired width and height
                              ),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.all(8), // Specify the desired padding
                              )
                          ),
                          icon: const Icon(Icons.volume_up),
                          label : const Text("")
                      ),
                      const SizedBox(height: 90, width: 40),
                    ]),
]
      ),
    )
    );
  }
}
