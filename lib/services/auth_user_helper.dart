import 'package:shared_preferences/shared_preferences.dart';
import 'database_strings.dart';

class AuthUserHelper {
  static Future<void> setSessionToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("sessionToken", value);
  }

  static Future<void> setUserID(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("userID", value);
  }

  static Future<String?> getSessionToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("sessionToken");
  }

  static Future<String?> getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userID");
  }
}
