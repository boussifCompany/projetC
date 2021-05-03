import 'package:clothis/models/wardrobe_model.dart';
import 'package:clothis/models/weather_model.dart';
import 'package:clothis/screens/home/components/weather_card.dart';
import 'package:clothis/widgets/outfit.dart';
import 'package:flutter/cupertino.dart';

class Homepage extends StatefulWidget {
  var showOutfit;
  WardrobeModel wardrobe;
  WeatherModel weather;
  var outfits;

  Homepage(this.showOutfit, this.wardrobe, this.weather, this.outfits);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Weather(retrieveTemp),
        (widget.weather != null
            ? WeatherCard(widget.weather.location, widget.weather.description,
                widget.weather.temp)
            : Container()),
        (widget.outfits.length >= 1
            ? GestureDetector(
                onTap: () => widget.showOutfit(widget.outfits[0]),
                child: (widget.outfits[0] != null ? Outfit() : null))
            : Container())
      ],
    );
  }
}
