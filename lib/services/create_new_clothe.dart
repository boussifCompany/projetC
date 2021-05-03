import 'package:clothis/services/get_current_user.dart';
import 'package:clothis/services/upload_file.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

Future<void> createNewCloth(String type, String color, String brand, File image, var hot) async {
  User user = getCurrentUser();
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection(user.uid);

  return userCollection
      .add({
        'type': type,
        'color': color,
        'brand': brand,
        'hot': hot,
      })
      .then((value) => uploadFile(image, value.id))
      .catchError((error) => print("Failed to add cloth: ${error}"));
}
