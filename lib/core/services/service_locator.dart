import 'package:chatui/core/utils/getit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPreferencesService {
  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  factory SharedPreferencesService() => _instance;

  SharedPreferencesService._internal();

  static Future<SharedPreferences> _preferences() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> remove() async {
    final prefs = await _preferences();
    await prefs.remove('credentials');
  }

  Future<void> saveCredentials(Map<String, dynamic> credentials) async {
    final prefs = await _preferences();
    final encodedCredentials = jsonEncode(credentials);
    await prefs.setString('credentials', encodedCredentials);
  }

  Future<Map<String, dynamic>?> getCredentials() async {
    final prefs = await _preferences();
    final data = prefs.getString('credentials');
    if (data != null) {
      return jsonDecode(data) as Map<String, dynamic>;
    } else {
      return null;
    }
  }
}
