class CurrentWeather {
  final num temperature;
  final num apparentTemperature;
  final num rain;
  final String? cityName;

  CurrentWeather(
      {required this.temperature,
      required this.rain,
      required this.apparentTemperature,
      this.cityName});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
      temperature: json["current"]["temperature_2m"],
      rain: json["current"]["rain"],
      apparentTemperature: json["current"]["apparent_temperature"]);

  Map<String, dynamic> toJson() => {
        "temperature": temperature,
        "rain": rain,
        "apparentTemperature": apparentTemperature,
      };
}
