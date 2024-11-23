import 'package:flutter/foundation.dart';
import 'package:weather_app/models/cities.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_services.dart';

class WeatherProvider extends ChangeNotifier {
  late CurrentWeather _currentWeather;

  CurrentWeather get currentWeather => _currentWeather;
  List<CurrentWeather> _allCitiesWeather = [];
  List<CurrentWeather> get allCitiesWeather => _allCitiesWeather;

  Future<void> getCurrentWeather(num lat, num lon) async {
    final data = await WeatherServices.getCurrentWeather(lat, lon);
    _currentWeather = data;
    notifyListeners();
  }

  Future<void> getAllCitiesWeather() async {
    final data = await WeatherServices.getAllCitiesWeather();
    _allCitiesWeather = data;
    notifyListeners();
  }

  WeatherProvider() {
    getCurrentWeather(cities.first.lat, cities.first.lon);
    getAllCitiesWeather();
  }
}
