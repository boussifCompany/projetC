import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:startup_project/modeles/clothe.dart';
import 'package:startup_project/modeles/wardrobe.dart';


class WardrobeStorage{
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return new File('$path/clothes.json');
  }

  Future<Wardrobe> fetchClothes() async{
    try{
      File file = await _localFile;
      var data = jsonDecode(file.readAsStringSync());
      List<Clothe> clothes = new List<Clothe>();

      if(data != null){
        data.forEach((element){
          clothes.add(Clothe.fromJson(element));
        });
      }

      return Wardrobe.withList(clothes);
    }catch(e){
      return new Wardrobe();
    }
  }

  Future<File> saveClothes(Wardrobe wardrobe) async{
    final file = await _localFile;
    print("file saved");
    return file.writeAsString('[{"color": "blue", "brand":"nike","type":"jean"}]');
  }

  Future<void> deleteFile() async{
    try{
      File file = await _localFile;

      if(await file.exists()){
        await file.delete();
        print("file deleted");
      }

    }catch(e){}
  }
}