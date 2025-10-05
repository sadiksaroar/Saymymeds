import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static const String _tokenKey = "access_token";

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final safe = token.trim();
    await prefs.setString(_tokenKey, safe);
    print("✅ Token Saved: $token");
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_tokenKey);
    return token?.trim();
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
