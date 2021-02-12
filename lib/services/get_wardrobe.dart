import 'package:clothis/models/cloth_model.dart';
import 'package:clothis/models/cloth_types.dart';
import 'package:clothis/models/colors_list.dart';
import 'package:clothis/models/wardrobe_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'get_current_user.dart';

Future<WardrobeModel> getWardrobe() async {
  User user = getCurrentUser();
  List<ClothModel> clothes = new List<ClothModel>();

  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection(user.uid).get();
  for (int i = 0; i < querySnapshot.docs.length; i++) {
    final data = querySnapshot.docs[i].data();
    final ColorsList color =
        EnumToString.fromString(ColorsList.values, data['color']);
    final ClothTypes type =
        EnumToString.fromString(ClothTypes.values, data['type']);
    final String brand = data['brand'];

    ClothModel cloth = new ClothModel(color, type, brand);
    clothes.add(cloth);
  }

  return new WardrobeModel(clothes);
}
