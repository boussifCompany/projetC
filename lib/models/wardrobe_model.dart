import 'package:clothis/models/cloth_model.dart';

class WardrobeModel {
  List<ClothModel> clothes;

  WardrobeModel(this.clothes);

  @override
  String toString() {
    StringBuffer s = new StringBuffer();
    clothes.forEach((element) {
      s.write(element.toString() + '\n');
    });
    return s.toString();
  }
}
