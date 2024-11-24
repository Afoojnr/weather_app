import 'package:flutter/foundation.dart';
import 'package:weather_app/models/cities.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_services.dart';

class WeatherProvider extends ChangeNotifier {
  late CurrentWeather _currentWeather;

  CurrentWeather get currentWeather => _currentWeather;
  List<CurrentWeather> _allCitiesWeather = [];
  List<CurrentWeather> get allCitiesWeather => _allCitiesWeather;
  bool isLoading = false;

  Future<void> getCurrentWeather(
      double lat, double lon, String cityName) async {
    isLoading = true;
    notifyListeners();

    final data = await WeatherServices.getCurrentWeather(lat, lon, cityName);
    _currentWeather = data;
    isLoading = false;

    notifyListeners();
  }

  Future<void> setCurrentWeather(CurrentWeather current) async {
    _currentWeather = current;
    notifyListeners();
  }

  Future<void> getAllCitiesWeather() async {
    final data = await WeatherServices.getAllCitiesWeather();
    _allCitiesWeather = data;
    notifyListeners();
  }

  WeatherProvider() {
    getCurrentWeather(cities.first.lat, cities.first.lon, cities.first.name);
    getAllCitiesWeather();
  }
}
