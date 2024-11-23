class City {
  final String name;
  final double lat;
  final double lon;

  const City({required this.name, required this.lat, required this.lon});
}

const List<City> cities = [
  City(name: "Montreal Canada", lat: 45.5088, lon: -73.5878),
  City(name: "Tokyo Japan", lat: 35.6895, lon: 139.6917),
  City(name: 'New Delhi India', lat: 28.5833, lon: 77.2),
  City(name: 'Paris France', lat: 48.85, lon: 2.3333),
  City(name: 'London England', lat: 51.4833, lon: -0.0833),
  City(name: 'New York USA', lat: 40.7167, lon: -74.0167),
  City(name: 'Tehran Iran', lat: 35.6833, lon: 51.4167),
  City(name: 'Lagos Nigeria', lat: 10, lon: 8),
];
