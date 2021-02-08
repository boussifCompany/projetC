import 'dart:convert';
import 'package:clothis/models/weather_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

Future<WeatherModel> fetchWeather() async{
  LocationData _data = await new Location().getLocation();
  await DotEnv.load(fileName: ".env");
  final res = await http.get("https://api.openweathermap.org/data/2.5/weather?lat=${_data.latitude}&lon=${_data.longitude}&units=metric&appid=${DotEnv.env['WEATHER_API']}");

  if(res.statusCode == 200){
    return WeatherModel.fromJson(jsonDecode(res.body));
  }else{
    throw Exception("Fail to fetch weather");
  }
}