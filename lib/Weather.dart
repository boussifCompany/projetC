import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:location/location.dart';

// Fetch the weather data
Future<Weather> fetchWeather() async{
  final location = new Location();
  final locationData = await location.getLocation();
  final String apiKey = "8a16e0ff655cec3211476bc60ce0a22a";
  final res = await http.get("https://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=${apiKey}");

  if(res.statusCode == 200){
    return Weather.fromJson(jsonDecode(res.body));
  }else{
    throw Exception("Fail to fetch weather");
  }
}

class Weather{
  final double temp;
  final String location;

  Weather({this.temp, this.location});

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      temp: json["main"]["temp"],
      location: json["name"],
    );
  }
}

class WeatherWidget extends StatefulWidget {
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  Future<Weather> futureWeather;

  @override
  void initState(){
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: futureWeather,
      builder: (context, snapshot){
        if(snapshot.hasData){
          // If we have the current weather we print it
          return Row(
            children: [
              Expanded(
                  child: Text("${snapshot.data.temp}")
              ),
              Expanded(
                  child: Text(snapshot.data.location)
              ),
            ],
          );
        //  We show the error
        }else if(snapshot.hasError){
            return Text("${snapshot.error}");
        }else{
          return Text("no data yet");
        }
      },
    );
  }
}
