String extractHour(String dateTimeString) {
  // Parse the string into a DateTime object
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Extract the hour
  int hour = dateTime.hour;

  // Determine AM or PM
  String period = hour >= 12 ? 'PM' : 'AM';

  // Convert to 12-hour format
  int formattedHour = hour % 12 == 0 ? 12 : hour % 12;

  // Return the formatted hour with period
  return "$formattedHour $period";
}
