import 'package:clothis/styles/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddClothForm extends StatefulWidget {
  @override
  _AddClothFormState createState() => _AddClothFormState();
}

class _AddClothFormState extends State<AddClothForm> {
  final _formKey = GlobalKey<FormState>();
  String _type;
  String _color;
  String _brand;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            'Add Cloth',
            style: TextStyle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: TextFormField(
            decoration: InputDecoration(hintText: 'Enter the cloth\'s type'),
            validator: (value) =>
                value.isEmpty ? 'You need to enter a type' : null,
            onSaved: (value) => _type = value.trim().toLowerCase(),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: TextFormField(
            decoration: InputDecoration(hintText: 'Enter the cloth\'s color'),
            validator: (value) =>
                value.isEmpty ? 'You need to enter a type' : null,
            onSaved: (value) => _color = value.trim().toLowerCase(),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: TextFormField(
            decoration: InputDecoration(hintText: 'Enter the cloth\'s brand'),
            validator: (value) =>
                value.isEmpty ? 'You need to enter a type' : null,
            onSaved: (value) => _brand = value.trim().toLowerCase(),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(12),
          child: RaisedButton(
              onPressed: null,
              color: primaryColor,
              textColor: Colors.white,
              child: Text( 'Add Clothe'
              ))
        )
      ],
    );
  }
}
