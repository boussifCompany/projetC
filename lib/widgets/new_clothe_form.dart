import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewClotheForm extends StatefulWidget {
  @override
  _NewClotheFormState createState() => _NewClotheFormState();
}

class _NewClotheFormState extends State<NewClotheForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Expanded(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, right: 16, left: 16),
                    child: TextFormField(
                      key: Key("brandField"),
                      decoration: InputDecoration(
                        labelText: "Brand",
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10),
                        ),
                        isDense: true,
                      ),
                      validator: (value){
                        if(value.isEmpty){
                          return "Please enter a brand";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, right: 16, left: 16),
                    child: TextFormField(
                      key: Key("colorField"),
                      decoration: InputDecoration(
                        labelText: "Color",
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10),
                        ),
                        isDense: true,
                      ),
                      validator: (value){
                        if(value.isEmpty){
                          return "Enter a color";
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                    child: TextFormField(
                      key: Key("typeField"),
                      decoration: InputDecoration(
                        labelText: "Type",
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10),
                        ),
                        isDense: true,
                      ),
                      validator: (value){
                        if(value.isEmpty){
                          return "You must enter a type";
                        }

                        return null;
                      },
                    )
                  ),
                  RaisedButton(
                    child: Text(
                        "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if(_formKey.currentState.validate()){
                        Navigator.of(context).pop();
                      }
                    },
                    color: Colors.blue,
                  )
                ],
              )
            ],
          ),
        ));
  }
}

void getValue(){
  
}
