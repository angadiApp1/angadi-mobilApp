import 'package:intl/intl.dart';

String extractDate(String dateTimeString) {
  try {
    // Replace slashes with dashes for consistency
    dateTimeString = dateTimeString.replaceAll('/', '-');

    // Parse the input string into a DateTime object
    DateTime parsedDate = DateTime.parse(dateTimeString);

    // Format and return the date in DD-MM-YYYY format
    return DateFormat('dd-MM-yyyy').format(parsedDate);
  } catch (e) {
    return ""; // Return empty string for invalid input
  }
}
