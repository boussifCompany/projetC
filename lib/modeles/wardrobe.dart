import 'dart:convert';
import 'clothe.dart';

class Wardrobe {
  List<Clothe> clothes;

  Wardrobe(){
    clothes = new List<Clothe>();
  }

  Wardrobe.withList(List<Clothe> _clothes){
    clothes = List<Clothe>.from(_clothes);
  }

  // Add a new clothes if the clothes doesn't already exist
  void addClothe(Clothe clothe) {
    bool exist = false;

    clothes.forEach((element) {
      if (element == clothe) {
        exist = true;
      }
    });

    if (!exist) {
      clothes.add(clothe);
      print("New clothe added");
    } else {
      print("Clothe already exist");
    }
  }

  // return number of clothes
  int numberOfClothes(){
    return clothes.length;
  }

  // return a list of all clothe corresponding to the type passed
  List<Clothe> getClotheListByType(String type) {
    List<Clothe> filteredList =
    clothes.where((element) => element.type == type).toList();

    return filteredList;
  }


  // Save the wardrobe as a json file
  String saveWardrobe() {
    StringBuffer data = new StringBuffer();
    data.write(jsonEncode(clothes));

    return data.toString();
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


