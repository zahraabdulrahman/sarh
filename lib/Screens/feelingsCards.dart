import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class feelingsCards extends StatefulWidget {
  const feelingsCards({super.key});

  @override
  State<feelingsCards> createState() => _feelingsCardsState();
}

class _feelingsCardsState extends State<feelingsCards> {

  List<String> selectedImages = [];
  AudioPlayer audioPlayer = AudioPlayer();

  Map<String, String> imageSoundMap = {
    'https://upload.wikimedia.org/wikipedia/commons/3/37/Sad-face.png':'https://example.com/sound2.mp3',
    'https://t4.ftcdn.net/jpg/01/36/70/67/360_F_136706734_KWhNBhLvY5XTlZVocpxFQK1FfKNOYbMj.jpg': 'https://example.com/sound2.mp3',
    'https://em-content.zobj.net/source/microsoft/378/angry-face_1f620.png':'',
    'https://www.iconarchive.com/download/i108249/google/noto-emoji-smileys/10038-sleeping-face.1024.png':','
    // Add more mappings as needed
  };

  // Future<void> _playSound(String soundUrl) async {
  //   final bytes = await http.readBytes(Uri.parse(soundUrl));
  //   await audioPlayer.playBytes(bytes);
  // }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

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
      body: Column(
        children: [
          Container(
            height: 70,
            width: double.infinity,
            color: Colors.grey,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: selectedImages.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(selectedImages[index]),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
            itemCount: imageSoundMap.length,
            itemBuilder: (BuildContext context, int index) {
              String imageUrl = imageSoundMap.keys.elementAt(index);
              String soundUrl = imageSoundMap.values.elementAt(index);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedImages.add(imageUrl);
                  });
                  // _playSound(soundUrl);
                },
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Image.network(imageUrl), // Load image from network
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
