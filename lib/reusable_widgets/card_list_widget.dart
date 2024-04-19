import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../data/cards_data.dart';
import '../models/card_model.dart';




class CardsBarWidget extends StatefulWidget {
  const CardsBarWidget({super.key});

  @override
  _CardsBarWidgetState createState() => _CardsBarWidgetState();
}

class _CardsBarWidgetState extends State<CardsBarWidget> {
  final player = AudioPlayer();



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 320,
              decoration: BoxDecoration(gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFC7EAE4), Color(0xFFFFD972)],
              ), borderRadius: BorderRadius.circular(15),),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: selectedCards.length,
                itemBuilder: (context, index) {
                  cardModel model = selectedCards[index];
                  return GestureDetector(
                    onTap: () {
                      // add to selected cards list
                      setState(() {
                        // Update the state here
                        AppMethods.addToSelectedList(model, context);
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFFA7E8BD),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.all(14),
                      child: Image.asset(model.imgPath),
                    ),
                  );

                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  playSounds();
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(40, 30), // Specify the desired width and height
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(8), // Specify the desired padding
                    )),
                icon: const Icon(Icons.volume_up),
                label: const Text("")),
            const SizedBox(height: 35, width: 40),
          ],
        ),
      ],
    );
  }

  Future<void> playSounds() async{
    for (cardModel card in selectedCards) {
      String audioPath = card.audioPath;
      await player.play(AssetSource(audioPath));
      await player.onPlayerComplete.first;
    }
  }
}

class AppMethods {
  AppMethods._();
  static void addToSelectedList(cardModel data, BuildContext context) {
    bool contains = selectedCards.contains(data);

    if (contains) {
      selectedCards.remove(data);
    } else {
      selectedCards.add(data);
    }
    print(selectedCards);
  }
}
