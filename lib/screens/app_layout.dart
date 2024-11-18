import 'package:flutter/material.dart';
import 'package:weather_app/screens/homepage.dart';
import 'package:weather_app/screens/location.dart';
import 'package:weather_app/screens/menu.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      // extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: currentPageIndex == 1
          ? null
          // AppBar(
          //     elevation: 0,
          //     backgroundColor: Colors.transparent,
          //   )
          : AppBar(
              title: const Text('Weather'),
              backgroundColor: theme.colorScheme.primary,
            ),
      bottomNavigationBar: NavigationBar(
          backgroundColor: theme.colorScheme.primary,
          onDestinationSelected: (value) => setState(() {
                currentPageIndex = value;
              }),
          selectedIndex: currentPageIndex,
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.location_on), label: "Location"),
            NavigationDestination(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.menu),
              label: "Menu",
            )
          ]),
      body: [
        const Location(),
        const Homepage(),
        const Menu(),
      ][currentPageIndex],
    );
  }
}
