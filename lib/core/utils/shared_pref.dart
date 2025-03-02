import 'package:shared_preferences/shared_preferences.dart';

/// A utility class to handle location-related SharedPreferences operations
class SharedPrefUtils {
  // Key for location ID
  static const String _keyLocationId = 'selected_location_id';

  /// Save the selected location ID to SharedPreferences
  static Future<bool> saveLocationId(String locationId) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_keyLocationId, locationId);
  }

  /// Get the saved location ID from SharedPreferences
  /// Returns null if no location ID is saved
  static Future<String?> getLocationId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyLocationId);
  }

  /// Clear the saved location ID
  static Future<bool> clearLocationId() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(_keyLocationId);
  }
}
