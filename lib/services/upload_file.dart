import 'package:clothis/services/get_current_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

Future<void> uploadFile(File file, String id) async {
  User user = getCurrentUser();
  Directory appDocDir = await getApplicationDocumentsDirectory();
  final fileName = path.basename(file.path);
  String filePath = '${appDocDir.absolute}/${fileName}';

  try {
    await FirebaseStorage.instance.ref('${user.uid}/${id}.png').putFile(
        file);
  } on FirebaseStorage catch(e){
    print("error on upload");
    print(e);
  }
}