import '../models/card_model.dart';

List<cardModel> cardsList = [
  cardModel(name: "سعيد",
      section: "feelings",
      audioPath: "sounds/سعيد.mp3",
      imgPath: "assets/images/happy.png"),

  cardModel(name: "غاضب",
      section: "feelings",
      audioPath: "sounds/غاضب.mp3",
      imgPath: "assets/images/angry.png"),

  cardModel(name: "حزين",
      section: "feelings",
      audioPath: "sounds/حزين.mp3",
      imgPath: "assets/images/sad.png"),

  cardModel(name: "برجر",
      section: "food",
      audioPath: "sounds/برجر.mp3",
      imgPath: "assets/images/hamburger.png"),

  cardModel(name: "جبن",
      section: "food",
      audioPath: "sounds/جبن.mp3",
      imgPath: "assets/images/cheese.png"),
];

List<cardModel> selectedCards = [];

List<cardModel> filterCardsBySection(List<cardModel> cardsList, String section) {
  return cardsList.where((card) => card.section == section).toList();
}