
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> fetchCardsData(String section) async {
  final cardsCollection = FirebaseFirestore.instance.collection('cards');
  final querySnapshot = await cardsCollection.where('section', isEqualTo: section).get();

  for (final cardDoc in querySnapshot.docs) {
    final cardData = cardDoc.data();

    final title = cardData['title'];
    final imagePath = cardData['imagePath'];
    final soundPath = cardData['soundPath'];
    final isSelected = cardData['isSelected'];
    final section = cardData['section'];
    // ...
  }
}

class ImageListtt extends StatelessWidget {
  final String section;

  const ImageListtt({super.key, required this.section});

  Future<List<DocumentSnapshot>> fetchCardImages(String section) async {
    final cardsCollection = FirebaseFirestore.instance.collection('cards');
    final querySnapshot = await cardsCollection.where('section', isEqualTo: section).get();

    return querySnapshot.docs;
  }

  Future<void> updateCardSelection(String cardId, bool isSelected) async {
    final cardDoc = FirebaseFirestore.instance.collection('cards').doc(cardId);

    await cardDoc.update({'isSelected': isSelected});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DocumentSnapshot>>(
      future: fetchCardImages(section),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final cardDocs = snapshot.data!;
          return ListView.builder(
            itemCount: cardDocs.length,
            itemBuilder: (context, index) {
              final cardDoc = cardDocs[index];
              final cardData = cardDoc.data() as Map<String, dynamic>;
              final cardId = cardDoc.id;
              final imagePath = cardData['imagePath'] as String?;
              final isSelected = cardData['isSelected'] as bool? ?? false;

              return CardItem(
                imagePath: imagePath,
                isSelected: isSelected,
                onCardSelected: (newSelectedState) {
                  updateCardSelection(cardId, newSelectedState);
                },
              );
            },
          );
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }
}

class CardItem extends StatefulWidget {
  final String? imagePath;
  final bool isSelected;
  final Function(bool) onCardSelected;

  const CardItem({super.key, required this.imagePath, required this.isSelected, required this.onCardSelected});

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.onCardSelected(isSelected);
        });
      },
      child: Container(
        height: 155,
        width: 155,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 2.0,
          ),
        ),
        child: widget.imagePath != null ? Image.asset(widget.imagePath!) : const Placeholder(),
      ),
    );
  }
}