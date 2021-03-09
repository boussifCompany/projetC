import 'dart:io';

import 'package:clothis/models/cloth_types.dart';
import 'package:clothis/models/colors_list.dart';
import 'package:clothis/styles/style.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class AddClothForm extends StatefulWidget {
  var callback;

  AddClothForm(this.callback);

  @override
  _AddClothFormState createState() => _AddClothFormState();
}

class _AddClothFormState extends State<AddClothForm> {
  final _formkey = GlobalKey<FormState>();
  File image = null;
  String imagePath = "";
  String _brand = "";
  String _type = EnumToString.convertToString(ClothTypes.SWEAT);
  String _color = EnumToString.convertToString(ColorsList.BLACK);

  void _sendData() {
    final form = _formkey.currentState;

    if (form.validate()) {
      form.save();
      widget.callback(_type, _color, _brand, image);
    }
  }

  Future<void> _takePicture() async {
    final picker = new ImagePicker();
    final file = await picker.getImage(source: ImageSource.camera);

    setState(() {
      image = File(file.path);
    });

    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final savedImage = await image.copy('${appDir.path}/${fileName}');

    
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Add Cloth',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: (image != null) ?
                  Image.file(image): null,
            ),
            RaisedButton(
                child: Padding(
                    padding: EdgeInsets.all(10), child: Text('Take a picture')),
                onPressed: _takePicture),
            DropdownButtonFormField(
              icon: Icon(Icons.arrow_downward),
              iconSize: 20,
              elevation: 16,
              value: _type,
              onChanged: (String newValue) {
                setState(() {
                  _type = newValue;
                });
              },
              onSaved: (value) => _type = value.trim(),
              style: TextStyle(color: primaryColor),
              items: EnumToString.toList(ClothTypes.values)
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButtonFormField(
              icon: Icon(Icons.arrow_downward),
              iconSize: 20,
              elevation: 16,
              value: _color,
              onChanged: (String newValue) {
                setState(() {
                  _color = newValue;
                });
              },
              onSaved: (value) => _color = value.trim(),
              style: TextStyle(color: primaryColor),
              items: EnumToString.toList(ColorsList.values)
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                decoration:
                    InputDecoration(hintText: 'Enter the cloth\'s brand'),
                validator: (value) =>
                    value.isEmpty ? 'You need to enter a type' : null,
                onSaved: (value) => _brand = value.trim().toLowerCase(),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(12),
                child: RaisedButton(
                    onPressed: _sendData,
                    color: primaryColor,
                    textColor: Colors.white,
                    child: Text('Add Clothe')))
          ],
        ));
  }
}
