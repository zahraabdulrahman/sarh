import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../data/cards_data.dart';
import '../models/card_model.dart';




class CardsBarWidget extends StatefulWidget {
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
              height: 150,
              width: 337,

              decoration: BoxDecoration(color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),),
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
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFFA7E8BD),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.all(14),
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
            TextButton.icon(
              onPressed: (){
                playMusic();
              },
              icon: Icon(Icons.music_note),
              label: Text('Play Music'),
            ),
            const SizedBox(height: 90, width: 40),
          ],
        ),
      ],
    );
  }

  Future<void> playMusic() async{
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

