import 'dart:io';

import 'package:clothis/services/get_current_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

Future<Image> getImage(String docId) async{
  User user = getCurrentUser();
  Directory appDir = await getApplicationDocumentsDirectory();
  Image img;

  try{
    final ref = await FirebaseStorage.instance
        .ref().child('${user.uid}/${docId}.png');
    final url = await ref.getDownloadURL();
    print(url);
    img = Image.network(url);
  } catch (e){
    print('error');
    print(e);
  }

  return img;
}