import 'package:shared_preferences/shared_preferences.dart';

class NewsHelpers {
  Future<bool> apiKeyExists() async {
    /// Returns a bool indicating if API exists or not

    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('api_key');
  }

  void storeApiKey(String key) async {
    /// Saves the given API key

    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ToDo: Add verification to check if API key is valid or not before saving it
    prefs.setString('api_key', key);
  }
}
