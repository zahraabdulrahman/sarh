import 'package:flutter/material.dart';

import '../../data/cards_data.dart';
import '../../models/card_model.dart';
import '../../reusable_widgets/card_list_widget.dart';
class Things extends StatefulWidget {
  const Things({super.key});

  @override
  State<Things> createState() => _ThingsState();
}

class _ThingsState extends State<Things> {
  @override
  Widget build(BuildContext context) {
    List<cardModel> filteredCards = filterCardsBySection(cardsList, "things");
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.bottomRight,
          child: Text(
            'بطاقات: أشياء وضمائر',
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
            const CardsBarWidget(),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: filteredCards.length,
                  itemBuilder: (context, index) {
                    cardModel model = filteredCards[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            // Update the selectedCards list here
                            AppMethods.addToSelectedList(model, context);
                          });
                        },
                        child: Center(
                          child: Stack(
                            children: [
                              Container(
                                width: 250,
                                height: 250,
                                decoration: BoxDecoration(color: const Color(0xFFA7E8BD),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              Positioned(
                                top: 10,
                                left: 40,
                                child: SizedBox(
                                  width: 167,
                                  height: 167,
                                  child: Image
                                    (image: AssetImage(model.imgPath)),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 90,
                                child: Text(model.name,
                                  style: const TextStyle(fontSize:30),),
                              )
                            ],
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