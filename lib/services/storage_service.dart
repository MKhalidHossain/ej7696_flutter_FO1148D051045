import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_constants.dart';

class StorageService {
  Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  // Token Management
  Future<void> saveToken(String token) async {
    final prefs = await _prefs;
    await prefs.setString(AppConstants.tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await _prefs;
    return prefs.getString(AppConstants.tokenKey);
  }

  Future<void> removeToken() async {
    final prefs = await _prefs;
    await prefs.remove(AppConstants.tokenKey);
  }

  // Refresh Token Management
  Future<void> saveRefreshToken(String refreshToken) async {
    final prefs = await _prefs;
    await prefs.setString(AppConstants.refreshTokenKey, refreshToken);
  }

  Future<String?> getRefreshToken() async {
    final prefs = await _prefs;
    return prefs.getString(AppConstants.refreshTokenKey);
  }

  Future<void> removeRefreshToken() async {
    final prefs = await _prefs;
    await prefs.remove(AppConstants.refreshTokenKey);
  }

  // User ID Management
  Future<void> saveUserId(String userId) async {
    final prefs = await _prefs;
    await prefs.setString(AppConstants.userIdKey, userId);
  }

  Future<String?> getUserId() async {
    final prefs = await _prefs;
    return prefs.getString(AppConstants.userIdKey);
  }

  Future<void> removeUserId() async {
    final prefs = await _prefs;
    await prefs.remove(AppConstants.userIdKey);
  }

  // Login Status
  Future<void> setLoggedIn(bool isLoggedIn) async {
    final prefs = await _prefs;
    await prefs.setBool(AppConstants.isLoggedInKey, isLoggedIn);
  }

  Future<bool> isLoggedIn() async {
    final prefs = await _prefs;
    return prefs.getBool(AppConstants.isLoggedInKey) ?? false;
  }

  // Generic Methods
  Future<void> saveString(String key, String value) async {
    final prefs = await _prefs;
    await prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  Future<void> saveBool(String key, bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    final prefs = await _prefs;
    return prefs.getBool(key);
  }

  Future<void> saveInt(String key, int value) async {
    final prefs = await _prefs;
    await prefs.setInt(key, value);
  }

  Future<int?> getInt(String key) async {
    final prefs = await _prefs;
    return prefs.getInt(key);
  }

  // Clear all data
  Future<void> clearAll() async {
    final prefs = await _prefs;
    await prefs.clear();
  }
}
