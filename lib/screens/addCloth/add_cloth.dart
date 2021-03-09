import 'dart:io';
import 'package:clothis/models/cloth_model.dart';
import 'package:clothis/models/cloth_types.dart';
import 'package:clothis/models/colors_list.dart';
import 'package:clothis/screens/addCloth/components/add_cloth_form.dart';
import 'package:clothis/services/create_new_clothe.dart';
import 'package:clothis/services/get_current_user.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCloth extends StatefulWidget {
  var callback;

  AddCloth(this.callback);
  @override
  _AddClothState createState() => _AddClothState();
}

class _AddClothState extends State<AddCloth> {
  User user = getCurrentUser();
  var ctx;

  void _retrieveData(String type, String color, String brand, File image){
    // Create a new cloth add it to the wardrobe and save it into the db
    ColorsList colorType = EnumToString.fromString(ColorsList.values, color);
    ClothTypes clothTypes = EnumToString.fromString(ClothTypes.values, type);
    Image clothImg = Image.file(image);

    ClothModel cloth = new ClothModel(colorType, clothTypes, brand, clothImg);
    // Save into db
    createNewCloth(type, color, brand, image);

    // Pass it to the wardrobe
    widget.callback(cloth);

    Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            backgroundColor: Colors.white,
            title: Text(
              'Add Cloth',
              style: TextStyle(color: Colors.black, fontSize: 20),
            )),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: AddClothForm(_retrieveData),
        ));
  }
}
