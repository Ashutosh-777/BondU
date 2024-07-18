import 'package:shared_preferences/shared_preferences.dart';

class AuthUserHelper {
  static Future<void> setSessionToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("sessionToken", value);
  }

  static Future<void> setLoginState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", value);
  }
  static Future<void> setFCMToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("fCMToken", token);
  }
  static Future<void> setFCMTokenSent(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("fCMTokenSent", status);
  }
  static Future<void> setPhone(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("userPhone", value);
  }

  static Future<void> setUserID(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("userID", value);
  }

  static Future<String?> getSessionToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("sessionToken");
  }

  static Future<bool> getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLoggedIn") ?? false;
  }
  static Future<String?> getFCMToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("fCMToken");
  }
  static Future<bool> getFCMTokenSent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool("fCMTokenSent")??false;
  }
  static Future<int> getPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return int.parse(prefs.getString("userPhone") ?? "0000000000");
  }

  static Future<String?> getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userID");
  }

  static Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await AuthUserHelper.setLoginState(false);
    await prefs.remove("userID");
    await prefs.remove("sessionToken");
    await prefs.remove("userData");
    await prefs.remove("fCMTokenSent");
    await prefs.remove("fCMToken");
  }
}
