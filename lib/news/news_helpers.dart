import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsHelpers {
  /// Conatains various helper functions to work with newsapi.org

  static const String api_url = 'https://newsapi.org/v2';
  static const List news_type = ['top-headlines', 'everything'];
  static const String default_api_url = '$api_url/top-headlines?country=in';
  static const Map<String, String> country = {
    'ae': 'United Arab Emirates',
    'ar': 'Argentina',
    'at': 'Austria',
    'au': 'Australia',
    'be': 'Belgium',
    'bg': 'Bulgaria',
    'br': 'Brazil',
    'ca': 'Canada',
    'ch': 'Switzerland',
    'cn': 'China',
    'co': 'Colombia',
    'cu': 'Cuba',
    'cz': 'Czech Republic',
    'de': 'Germany',
    'eg': 'Egypt',
    'fr': 'France',
    'gb': 'United Kingdom',
    'gr': 'Greece',
    'hk': 'Hong Kong',
    'hu': 'Hungary',
    'id': 'Indonesia',
    'ie': 'Ireland',
    'il': 'Israel',
    'in': 'India',
    'it': 'Italy',
    'jp': 'Japan',
    'kr': 'South Korea',
    'lt': 'Lithuania',
    'lv': 'Latvia',
    'ma': 'Morocco',
    'mx': 'Mexico',
    'my': 'Malaysia',
    'ng': 'Nigeria',
    'nl': 'Netherlands',
    'no': 'Norway',
    'nz': 'New Zealand',
    'ph': 'Philippines',
    'pl': 'Poland',
    'pt': 'Portugal',
    'ro': 'Romania',
    'rs': 'Serbia',
    'ru': 'Russia',
    'sa': 'Saudi Arabia',
    'se': 'Sweden',
    'sg': 'Singapore',
    'si': 'Slovenia',
    'sk': 'Slovakia',
    'th': 'Thailand',
    'tr': 'Turkey',
    'tw': 'Taiwan',
    'ua': 'Ukraine',
    'us': 'United States',
    've': 'Venuzuela',
    'za': 'South Africa',
  };

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

  Future<dynamic> fetchNews() async {
    /// Fetches & returns news from newsapi.org

    SharedPreferences prefs = await SharedPreferences.getInstance();

    final String apiKey = prefs.getString('api_key');
    final reponse = await get(
      default_api_url,
      headers: {HttpHeaders.authorizationHeader: apiKey},
    );
    // ToDo: Handle errors with [reponse.statusCode] before returning
    final jsonResponse = jsonDecode(reponse.body);
    return jsonResponse['articles'];
  }
}
