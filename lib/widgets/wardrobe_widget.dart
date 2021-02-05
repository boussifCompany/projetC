import 'package:flutter/cupertino.dart';
import 'package:startup_project/modeles/wardrobe.dart';
import 'package:startup_project/modeles/wardrobe_storage.dart';

class WardrobeWidget extends StatefulWidget {
  @override
  _WardrobeWidgetState createState() => _WardrobeWidgetState();
}

class _WardrobeWidgetState extends State<WardrobeWidget> {
  Future<Wardrobe> wardrobe = new WardrobeStorage().fetchClothes();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: wardrobe,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: ListView.builder(
                itemCount: snapshot.data.numberOfClothes(),
                itemBuilder: (context, index) {
                  return Text("I'm a clothe");
                },
              ),
            );
          } else {
            return Text("waiting");
          }
        });
  }
}
