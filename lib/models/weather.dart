import 'package:weather_app/models/cities.dart';

class CurrentWeather {
  final double temperature;
  final double apparentTemperature;
  final double rain;
  final City city;

  CurrentWeather(
      {required this.temperature,
      required this.rain,
      required this.apparentTemperature,
     required this.city});

  // factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
  //     temperature: json["current"]["temperature_2m"],
  //     rain: json["current"]["rain"],
  //     apparentTemperature: json["current"]["apparent_temperature"]);

  // Map<String, dynamic> toJson() => {
  //       "temperature": temperature,
  //       "rain": rain,
  //       "apparentTemperature": apparentTemperature,
  //     };
}
