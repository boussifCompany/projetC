import 'package:clothis/models/cloth_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cloth extends StatelessWidget {
  final ClothModel cloth;

  Cloth(this.cloth);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              new BoxShadow(
                  color: Colors.black12,
                  offset: new Offset(0, 0),
                  blurRadius: 10)
            ]),
        child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                this.cloth.img,
                Text('Type'),
                Text('Color'),
                Text('brand')
              ],
            )));
  }
}
