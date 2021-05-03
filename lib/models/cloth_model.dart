import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';


import 'package:clothis/models/cloth_types.dart';
import 'package:clothis/models/colors_list.dart';

class ClothModel{
  final String brand;
  final ColorsList color;
  final ClothTypes type;
  final Image img;
  final hot;

  ClothModel(this.color, this.type, this.brand,  this.img, this.hot);

  Map<String, dynamic> getProperties() {
    Map<String, dynamic> properties = new Map<String, dynamic>();
    properties['color'] = this.color;
    properties['type'] = this.type;
    properties['hot'] = this.hot;
    return properties;
  }

  @override
  String toString() {
    return "{type: ${type}, color: ${color}, brand: ${brand}}";
  }
}