// This file is kept for compatibility but all API calls have been removed
// Only design/UI code remains in the app

import 'storage_service.dart';

class AuthService {
  final StorageService _storageService = StorageService();

  /// Check if user is authenticated (design only - no API call)
  Future<bool> isAuthenticated() async {
    final token = await _storageService.getToken();
    final isLoggedIn = await _storageService.isLoggedIn();
    return token != null && isLoggedIn;
  }

  /// Logout user (design only - clears local storage)
  Future<void> logout() async {
    await _storageService.removeToken();
    await _storageService.removeRefreshToken();
    await _storageService.removeUserId();
    await _storageService.setLoggedIn(false);
  }
}
