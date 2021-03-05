import 'package:clothis/models/wardrobe_model.dart';
import 'package:clothis/widgets/Cloth.dart';
import 'package:flutter/cupertino.dart';

class Wardrobe extends StatefulWidget {
  WardrobeModel wardrobe;

  Wardrobe(this.wardrobe);
  @override
  _WardrobeState createState() => _WardrobeState();
}

class _WardrobeState extends State<Wardrobe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        primary: false,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: widget.wardrobe.clothes.map((e) => Cloth(e)).toList(),
      ),
    );
  }
}
