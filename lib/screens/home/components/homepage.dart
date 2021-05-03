import 'package:clothis/screens/home/components/weather.dart';
import 'package:clothis/screens/home/home.dart';
import 'package:clothis/screens/outfitPage/outfit_page.dart';
import 'package:clothis/widgets/outfit.dart';
import 'package:flutter/cupertino.dart';

class Homepage extends StatefulWidget {
  var callback;
  var showOutfit;
  var wardrobe;

  Homepage(this.callback, this.showOutfit, this.wardrobe);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var outfits = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      outfits.add(widget.wardrobe.generateOutfit(18));
    });
  }

  void retrieveTemp(temp) {
    widget.callback(temp);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Weather(retrieveTemp),
        (outfits.length >= 1
            ? GestureDetector(
                onTap: () => widget.showOutfit(outfits[0]), child: Outfit())
            : Container())
      ],
    );
  }
}
