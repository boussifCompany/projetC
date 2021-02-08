import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'get_current_user.dart';

Future<void> getWardrobe() async {
  User user = getCurrentUser();

  QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(user.uid).get();
  for(int i = 0; i < querySnapshot.docs.length; i++){
    print(querySnapshot.docs[i].data());
  }
}
