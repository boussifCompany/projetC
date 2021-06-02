import 'package:clothis/models/outfit_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:enum_to_string/enum_to_string.dart';


class OutfitPage extends StatefulWidget {
  OutfitModel outfit;

  OutfitPage(this.outfit);

  @override
  _OutfitPageState createState() => _OutfitPageState();
}

class _OutfitPageState extends State<OutfitPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.outfit);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          'Outfit',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: widget.outfit.clothes.length,
            itemBuilder: (BuildContext ctx, int index) {
              return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.black12,
                                offset: new Offset(0, 0),
                                blurRadius: 10)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: 100,
                                height: 100,
                                child: widget.outfit.clothes[index].img),
                            Container(
                              child: Container(
                                child: Column(
                                  children: [
                                    Text(EnumToString.convertToString(widget.outfit.clothes[index].type)),
                                    Text(widget.outfit.clothes[index].brand),
                                    Text('${widget.outfit.clothes[index].hot}')
                                  ],
                                ),
                              )
                            )
                          ],
                        ),
                      )));
            }),
      ),
    );
  }
}
