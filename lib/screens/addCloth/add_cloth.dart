
import 'package:clothis/screens/addCloth/components/add_cloth_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCloth extends StatefulWidget {
  @override
  _AddClothState createState() => _AddClothState();
}

class _AddClothState extends State<AddCloth> {
  @override
  Widget build(BuildContext context) {
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
          child: AddClothForm(),
        ));
  }
}
