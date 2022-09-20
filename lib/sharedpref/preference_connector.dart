import 'package:shared_preferences/shared_preferences.dart';

class PreferenceConnector {
  _getSharedPreference() async {
    return await SharedPreferences.getInstance();
  }

  Future<String> getString(String key) async {
    SharedPreferences prefs = await _getSharedPreference();
    return prefs.getString(key) ?? '';
  }
  static Future<String> getJsonToSharedPreferenceefcmtoken(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }
  static Future<bool> setJsonToSharedPreferenceefcmtoken(
      String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(key, value);
  }

    setLoginData(bool isLogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin' , isLogin);
  }

  setRole(String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('role' , role);
  }

  setScreen(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('chatscreen' , value);
  }

  setProfileData(String name,String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName' , name);
    prefs.setString('userEmail', email);
  }

  static Future<String> getJsonToSharedPreferenceechatscreen(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  static Future<bool> setJsonToSharedPreferencechatscreen(
      String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(key, value);
  }

  setProfileImage(String image) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('profileImage' , image);
  }

  setCurrentChatUserName(String chatUserName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('chatUserName' , chatUserName);
  }

  Future<int> getInt(String key) async {
    SharedPreferences prefs = await _getSharedPreference();
    return prefs.getInt(key) ?? -1;
  }

  Future<double> getDouble(String key) async {
    SharedPreferences prefs = await _getSharedPreference();
    return prefs.getDouble(key) ?? -1;
  }

  Future<bool> getBool(String key) async {
    SharedPreferences prefs = await _getSharedPreference();
    return prefs.getBool(key) ?? false;
  }

  void setString(String key, String value) async {
    SharedPreferences prefs = await _getSharedPreference();
    prefs.setString(key, value);
  }

  void setInt(String key, int value) async {
    SharedPreferences prefs = await _getSharedPreference();
    prefs.setInt(key, value);
  }

  void setDouble(String key, double value) async {
    SharedPreferences prefs = await _getSharedPreference();
    prefs.setDouble(key, value);
  }

  void setBool(String key, bool value) async {
    SharedPreferences prefs = await _getSharedPreference();
    prefs.setBool(key, value);
  }

  void removePreference(String key) async {
    SharedPreferences prefs = await _getSharedPreference();
    prefs.remove(key);
  }

  void clear() async {
    SharedPreferences prefs = await _getSharedPreference();
    prefs.clear();
  }

  static Future<bool> saveSharedPreference(String key, String value
      /*,String key2,String value2*/) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(key, value /*,key2,value2*/);
  }

  static Future<bool> setBoolSharedPreference(String key, bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(key, value);
  }

  static Future<bool> getBoolSharedPreference(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(key);
  }

  static Future<String> getSharedPreference(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  static Future<bool> setJsonToSharedPreference(
      String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(key, value);
  }

  static Future<String> getJsonToSharedPreference(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  static Future<bool> setJsonToSharedPreferencename(
      String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(key, value);
  }

  static Future<String> getJsonToSharedPreferencename(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  static Future<bool> setJsonToSharedPreferenceemail(
      String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(key, value);
  }

  static Future<String> getJsonToSharedPreferenceemail(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  static Future<bool> setJsonToSharedPreferencephone(
      String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(key, value);
  }

  static Future<bool> setJsonToSharedPreferencertmuserpeerid(
      String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(key, value);
  }

  static Future<String> getJsonToSharedPreferenceertmuserpeerid(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key)
    ;
  }
  static Future<String> getJsonToSharedPreferenceephone(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  static Future<bool> setJsonToSharedPreferencetoken(
      String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(key, value);
  }

  static Future<String> getJsonToSharedPreferencetoken(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }
}
