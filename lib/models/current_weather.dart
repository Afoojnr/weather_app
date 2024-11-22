class Current {
  final num temperature;
  final num apparentTemperature;
  final num rain;

  Current(
      {required this.temperature,
      required this.rain,
      required this.apparentTemperature});

  factory Current.fromJson(Map<String, dynamic> json) => Current(
      temperature: json["temperature"],
      rain: json["rain"],
      apparentTemperature: json["apparentTemperature"]);

      Map<String, dynamic> toJson() => {
        "temperature": temperature,
        "rain": rain,
        "apparentTemperature": apparentTemperature,
      };
}
