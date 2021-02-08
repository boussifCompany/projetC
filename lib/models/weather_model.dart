class WeatherModel{
  final double temp;
  final String description;
  final String location;

  WeatherModel({this.temp, this.description, this.location});

  factory WeatherModel.fromJson(Map<String, dynamic> json){
    return WeatherModel(
      temp: json['main']['temp'],
      description: json['weather'][0]['description'],
      location: json['name']
    );
  }
}