import 'package:clothis/models/cloth_model.dart';
import 'package:clothis/models/cloth_types.dart';
import 'package:clothis/models/outfit_model.dart';
import 'package:enum_to_string/enum_to_string.dart';

class WardrobeModel {
  List<ClothModel> clothes;

  WardrobeModel(this.clothes);

  void addCloth(ClothModel cloth) {
    this.clothes.add(cloth);
  }

  OutfitModel generateOutfit(var temp) {
    List<Map> clothesTypes = new List<Map>();

    // We start by checking that we have enough cloth
    if(!isEnoughCloth()){
      return null;
    }

    if (temp >= 18) {
      clothesTypes = [
        {'type': 'pant'},
        {'type': 'tshirt'},
        {'type': 'coat'}
      ];
    } else if (temp >= 12) {
      clothesTypes = [
        {'type': 'pant'},
        {'type': 'tshirt'},
        {'type': 'sweat'},
        {'type': 'coat'}
      ];
    } else {
      clothesTypes = [
        {'type': 'pant'},
        {'type': 't-shirt'},
        {'type': 'sweat'},
        {'type': 'coat'}
      ];
    }
  }

  bool isEnoughCloth(){
    bool containsAll = true;
    Set<String> clothTypes = new Set<String>();

    // We get all of the types of clothes
    clothes.forEach((cloth) {
        clothTypes.add(EnumToString.convertToString(cloth.type));
    });

    EnumToString.toList(ClothTypes.values).forEach((value) {
      if(!clothTypes.contains(value)){
        containsAll = false;
      }
    });

    return containsAll;
  }

  ClothModel selectCloth(List<Map> req) {

  }

  @override
  String toString() {
    StringBuffer s = new StringBuffer();
    clothes.forEach((element) {
      s.write(element.toString() + '\n');
    });
    return s.toString();
  }
}
