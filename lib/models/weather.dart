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

class HourlyWeather {
  // final List<num> temperature;
  final dynamic temperature;
  final dynamic time;
  final dynamic rain;

  // final List<String> time;
  // final List<double> rain;

  HourlyWeather({
    required this.temperature,
    required this.rain,
    required this.time,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) => HourlyWeather(
      temperature: json["hourly"]["temperature_2m"],
      rain: json["hourly"]["rain"],
      time: json["hourly"]["time"]);
}

class DailyWeather {
  // final List<num> temperature;
  final dynamic temperature;
  final dynamic time;
  final dynamic rain;


  // final List<String> time;
  // final List<double> rain;

  DailyWeather({
    required this.temperature,
    required this.rain,
    required this.time,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) => DailyWeather(
      temperature: json["daily"]["temperature_2m_max"],
      rain: json["daily"]["rain_sum"],
      time: json["daily"]["time"]);
}
