import 'package:flutter/cupertino.dart';


import 'package:clothis/models/cloth_types.dart';
import 'package:clothis/models/colors_list.dart';

class ClothModel{
  final String brand;
  final ColorsList color;
  final ClothTypes type;
  final Image img;

  ClothModel(this.color, this.type, this.brand,  this.img);

  @override
  String toString() {
    return "{type: ${type}, color: ${color}, brand: ${brand}}";
  }
}