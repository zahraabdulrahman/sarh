import 'package:flutter/material.dart';
import 'package:sarh/data/cards_data.dart';
import 'package:sarh/reusable_widgets/card_list_widget.dart';

class Sentences extends StatefulWidget {
  const Sentences({super.key});

  @override
  State<Sentences> createState() => _SentencesState();
}

class _SentencesState extends State<Sentences> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.bottomRight,
          child: Text(
            'بطاقات: جمل محفوظة',
            style: TextStyle(color: Colors.black, fontSize: 28),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/صرح.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        toolbarHeight: 250,
      ),
        body: Column(
          children: [
            CardsBarWidget(),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: memorizedSelectedCards.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedCards = memorizedSelectedCards[index];
                            print(selectedCards);
                          });
                        },
                        child: Center(
                          child:
                              Container(
                                width: 250,
                                height: 250,
                                child: Center(child: Text("$index",
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),)),
                                decoration: BoxDecoration(color: const Color(0xFFA7E8BD),
                                    borderRadius: BorderRadius.circular(15)),
                              ),

                        ),
                      ),
                    );

                  }),
            ),
          ],
        )

    );
  }}