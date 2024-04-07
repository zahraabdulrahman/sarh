import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
final GlobalKey<_CardListWidgetState> cardListKey = GlobalKey<_CardListWidgetState>();

class CardModel {
  final String imagePath;
  final String audioPath;
  bool isSelected;

  CardModel({required this.imagePath,
    required this.audioPath,
    this.isSelected = false});
}


class CardListWidget extends StatefulWidget {
  final List<CardModel> cards;

  const CardListWidget({super.key, required this.cards});

  @override
  _CardListWidgetState createState() => _CardListWidgetState();
}

class _CardListWidgetState extends State<CardListWidget> {
  List<CardModel> selectedCards = [];
  AudioPlayer audioPlayer = AudioPlayer();

  void playSelectedCardsAudio() async {
    print('Playing audio for selected cards: $selectedCards');
    for (var card in selectedCards) {
      print('Playing audio for card: ${card.audioPath}');
      await audioPlayer.play(card.audioPath as Source);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.cards.length,
      itemBuilder: (context, index) {
        final card = widget.cards[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              card.isSelected = !card.isSelected;
              if (card.isSelected) {
                selectedCards.add(card);
              } else {
                selectedCards.remove(card);
              }
            });
          },
          child: Card(
            child: Container(
              height: 155,
              width: 155,
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(card.imagePath),
            ),
          ),
        );
      },
    );
  }
}

final List<CardModel> cards_feelings = [
  CardModel(
    imagePath: 'assets/images/happy.png',
    audioPath: 'assets/sounds/happy.m4a',
  ),

];


Column cardsBar() {
  return Column(
    children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: 150,
          width: 337,
          decoration: const BoxDecoration(color: Colors.grey),
        )
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        ElevatedButton.icon(
            onPressed: () {
               cardListKey.currentState?.playSelectedCardsAudio();
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                fixedSize: MaterialStateProperty.all<Size>(
                  const Size(73, 50), // Specify the desired width and height
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(8), // Specify the desired padding
                )),
            icon: const Icon(Icons.volume_up),
            label: const Text("")),
        const SizedBox(height: 90, width: 40),
      ]),
    ],
  );
}

