import 'package:clothis/models/cloth_types.dart';
import 'package:clothis/models/colors_list.dart';

class ClothModel{
  final String brand;
  final ColorsList color;
  final ClothTypes type;

  ClothModel(this.color, this.type, this.brand);

  @override
  String toString() {
    return "{type: ${type}, color: ${color}, brand: ${brand}}";
  }
}