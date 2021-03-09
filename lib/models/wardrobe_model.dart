import 'dart:math';

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

  List<ClothModel> getOutfit(List<Map> req){
    List<ClothModel> res = new List<ClothModel>();
    req.forEach((element) {
      List<ClothModel> temp = new List<ClothModel>();
      clothes.forEach((clothe) {
        Map properties = clothe.getProperties();
        bool k = true;

        element.forEach((key, value) {
          if (properties[key] != value) {
            k = false;
          }
        });

        if (k == true) {
          temp.add(clothe);
        }
      });

      var random = new Random();
      var n = random.nextInt(temp.length);
      res.add(temp[n]);
    });

    return res;
  }

  OutfitModel generateOutfit(var temp) {
    List<Map> clothesTypes = new List<Map>();

    // We start by checking that we have enough cloth
    if(!isEnoughCloth()){
      return null;
    }

    if (temp >= 18) {
      clothesTypes = [
        {'type': ClothTypes.PANT},
        {'type': ClothTypes.TSHIRT},
        {'type': ClothTypes.COAT}
      ];
    } else if (temp >= 12) {
      clothesTypes = [
        {'type': ClothTypes.PANT},
        {'type': ClothTypes.TSHIRT},
        {'type': ClothTypes.SWEAT},
        {'type': ClothTypes.COAT}
      ];
    } else {
      clothesTypes = [
        {'type': ClothTypes.PANT},
        {'type': ClothTypes.TSHIRT},
        {'type': ClothTypes.SWEAT},
        {'type': ClothTypes.COAT}
      ];
    }

    return new OutfitModel(getOutfit(clothesTypes));
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

  @override
  String toString() {
    StringBuffer s = new StringBuffer();
    clothes.forEach((element) {
      s.write(element.toString() + '\n');
    });
    return s.toString();
  }
}
