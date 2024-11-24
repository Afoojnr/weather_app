import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          TextField(
            onChanged: null,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: "Search for a city of airport",
              filled: true,
              fillColor: theme.colorScheme.primary,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Expanded(child: LocationListView()),
        ],
      ),
    );
  }
}

class LocationListView extends StatelessWidget {
  const LocationListView({super.key});

  @override
  Widget build(BuildContext context) {
    final readWeaterState = context.read<WeatherProvider>();
    final watchWeaterState = context.watch<WeatherProvider>();
    final isLoading = watchWeaterState.isLoading;
    final citiesData = watchWeaterState.allCitiesWeather;

    return isLoading
        ? const CircularProgressIndicator.adaptive()
        : ListView.separated(
            itemCount: citiesData.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () =>
                    readWeaterState.setCurrentWeather(citiesData[index]),
                child: LocationCard(
                    cityName: citiesData[index].city.name,
                    apparentTemperature:
                        citiesData[index].apparentTemperature.toInt(),
                    temperature: citiesData[index].temperature.toInt(),
                    rain: citiesData[index].rain.toInt()),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
          );
  }
}

class LocationCard extends StatelessWidget {
  const LocationCard(
      {super.key,
      required this.cityName,
      required this.apparentTemperature,
      required this.temperature,
      required this.rain});

  final String cityName;
  final int temperature;
  final int rain;
  final int apparentTemperature;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(children: [
      ClipPath(
        clipper: LocationCardClipper(),
        child: Container(
          height: 200,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                  colors: [Color(0xff5936B4), Color(0xff362A84)])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(),
              Text(
                "$temperature°",
                style: theme.textTheme.displayLarge!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("H:$temperature°C L:$apparentTemperature°C",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w300)),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(cityName,
                          style: theme.textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.w500)),
                      Text(rain > 0 ? "Mid Rain" : "Mostly Clear",
                          style: theme.textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.w500))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      const Positioned(
        top: -10,
        right: 5,
        child: Image(
          image: AssetImage('assets/icons/big/mcmr.png'),
          width: 180,
          height: 180,
        ),
      ),
    ]);
  }
}

class LocationCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(size.width * 0.1, 0);

    path.quadraticBezierTo(
      size.width * 0.2,
      0,
      size.width,
      size.height * 0.4,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
