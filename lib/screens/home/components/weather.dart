import 'package:clothis/models/weather_model.dart';
import 'package:clothis/screens/home/components/weather_card.dart';
import 'package:clothis/services/fetch_weather.dart';
import 'package:flutter/cupertino.dart';

class Weather extends StatefulWidget {
  var retrieveTemp;
  Weather(this.retrieveTemp);
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Future<WeatherModel> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureWeather,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            widget.retrieveTemp(snapshot.data.temp);

            return WeatherCard(
              description: snapshot.data.description,
              temp: snapshot.data.temp,
              location: snapshot.data.location,
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text("Error occured");
          }

          return Text('Pending...');
        });
  }
}
