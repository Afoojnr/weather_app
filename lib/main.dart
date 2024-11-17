import 'package:flutter/material.dart';
import 'package:weather_app/screens/app_layout.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const AppLayout(),
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: const Color(0xff1f1d47),
            primary: const Color(0xff1f1d47),
          ),
        ));
  }
}
