import 'package:shared_preferences/shared_preferences.dart';
import 'database_strings.dart';
class AuthUserHelper{
  static Future<void> setSessionToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(BackendHelper.sessionToken, value);
  }
  static Future<String> getSessionToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(BackendHelper.sessionToken) ?? " ";
  }
}