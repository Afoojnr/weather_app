import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/cities.dart';

import 'package:weather_app/models/weather.dart';

class WeatherServices {
  static const baseUrl = 'https://api.open-meteo.com/v1/forecast?';

  static Future<CurrentWeather> getCurrentWeather(num lat, num lon) async {
    final url =
        "${baseUrl}latitude=$lat&longitude=$lon&current=temperature_2m,apparent_temperature,rain&timezone=auto";
    final res = await _fetchData(url);

    return CurrentWeather.fromJson(res);
  }

  static Future<List<CurrentWeather>> getAllCitiesWeather() async {
    List<String> latitudes = [];
    List<String> longitudes = [];
    List<CurrentWeather> allCitiesWeather = [];

    for (var city in cities) {
      latitudes.add("${city.lat}");
      longitudes.add("${city.lon}");
    }
    String latString = latitudes.join(',');
    String lonString = longitudes.join(',');

    final url =
        "${baseUrl}latitude=$latString&longitude=$lonString&current=temperature_2m,apparent_temperature,rain&timezone=auto";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        for (int i = 0; i < cities.length; i++) {
          var city = cities[i];
          var data = res[i];

          // Create CurrentWeather instance with cityName directly
          allCitiesWeather.add(CurrentWeather(
            temperature: data["current"]["temperature_2m"],
            apparentTemperature: data["current"]["apparent_temperature"],
            rain: data["current"]["rain"],
            cityName: city.name,
          ));
        }
        // for (var data in res) {
        //   allCitiesWeather.add(CurrentWeather.fromJson(data));
        // }
        //  for (var city in cities) {
        //   // allCitiesWeather
        // }
        // debugPrint("$allCitiesWeather");

        return allCitiesWeather;
      } else {
        debugPrint('Failed to load data: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      debugPrint('Error fetching data from $url: $e');
      throw Exception('Error fetching data');
    }
//     final res = await _fetchData(url);
//     debugPrint("$res");

//    for (var data in res)
// {

// }    return CurrentWeather(temperature: 10, rain: 10, apparentTemperature: 4);
  }

//   static buildCurrentWeatherUrl() {
//     var latitudes = [];
//     var longitudes = [];

//     for (var city in cities) {
//       latitudes.add("${city.lat}");
//       longitudes.add("${city.lon}");
//     }
//     var latString = latitudes.join(',');
//     // print(latString);
//     var lonString = longitudes.join(',');
// // debugPrint()
//     return "${baseUrl}latitude=$latString&longitude=$lonString&current=temperature_2m,apparent_temperature,rain&timezone=auto";
//   }

  static Future<Map<String, dynamic>> _fetchData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        debugPrint('Failed to load data: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      debugPrint('Error fetching data from $url: $e');
      throw Exception('Error fetching data');
    }
  }
}
