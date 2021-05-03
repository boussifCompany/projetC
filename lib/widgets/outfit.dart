import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Outfit extends StatefulWidget {

  @override
  _OutfitState createState() => _OutfitState();
}

class _OutfitState extends State<Outfit> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
            onTap: null,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    new BoxShadow(
                        color: Colors.black12,
                        offset: new Offset(0, 0),
                        blurRadius: 10)
                  ]),
              child:
                  Padding(padding: EdgeInsets.all(10), child: Text("Outfit")),
            )));
  }
}
