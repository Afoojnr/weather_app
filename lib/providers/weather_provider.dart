import 'package:flutter/foundation.dart';
import 'package:weather_app/models/cities.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_services.dart';

class WeatherProvider extends ChangeNotifier {
  late CurrentWeather _currentWeather;
  List<CurrentWeather> _allCitiesWeather = [];
  late HourlyWeather _hourlyWeather;
  late DailyWeather _dailyWeather;
  bool isLoading = false;

  List<CurrentWeather> get allCitiesWeather => _allCitiesWeather;
  CurrentWeather get currentWeather => _currentWeather;
  HourlyWeather get hourlyWeather => _hourlyWeather;
  DailyWeather get dailyWeather => _dailyWeather;

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

  Future<void> getHourlyWeather(lat, lon) async {
    final data = await WeatherServices.getHourlyWeather(lat, lon);
    _hourlyWeather = data;
    notifyListeners();
  }

  Future<void> getDailyWeather(lat, lon) async {
    final data = await WeatherServices.getDailyWeather(lat, lon);
    _dailyWeather = data;
    debugPrint("${_dailyWeather.time}");

    notifyListeners();
  }

  WeatherProvider() {
    getCurrentWeather(cities.first.lat, cities.first.lon, cities.first.name);
    getHourlyWeather(cities.first.lat, cities.first.lon);
    getDailyWeather(cities.first.lat, cities.first.lon);
    getAllCitiesWeather();
  }
}
