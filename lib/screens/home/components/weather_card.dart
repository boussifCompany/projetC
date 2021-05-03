import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherCard extends StatefulWidget {
  final String location;
  final String description;
  var temp;

  WeatherCard(this.location, this.description, this.temp);

  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          new BoxShadow(
            color: Colors.black12,
            offset: new Offset(0, 0),
            blurRadius: 10
          )
        ]
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text('${widget.description}')
            ),
            Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text('${widget.temp}°', style: TextStyle(fontSize: 32),)
                )
            )
          ],
        )
      )
    );
  }
}
