

class cardModel {
  String name;
  String section;
  String audioPath;
  String imgPath;

  cardModel({
    required this.name,
    required this.section,
    required this.audioPath,
    required this.imgPath,
});
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'section': section,
      'audioPath': audioPath,
      'imgPath': imgPath,
    };
  }
}