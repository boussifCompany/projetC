import 'package:clothis/models/cloth_types.dart';
import 'package:clothis/models/colors_list.dart';
import 'package:clothis/services/get_current_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> createNewCloth(String type, String color, String brand) async {
  User user = getCurrentUser();
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection(user.uid);

  return userCollection
      .add({
        'type': type,
        'color': color,
        'brand': brand
      })
      .then((value) => print("Cloth added"))
      .catchError((error) => print("Failed to add cloth: ${error}"));
}
