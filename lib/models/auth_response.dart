import 'user_model.dart';

class AuthResponse {
  final String? accessToken;
  final String? refreshToken;
  final String? role;
  final String? userId;
  final UserModel? user;

  AuthResponse({
    this.accessToken,
    this.refreshToken,
    this.role,
    this.userId,
    this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    // Handle both registration (user data at top level) and login (nested user) responses
    final userData = json['user'] ?? json; // If no 'user' key, use the entire json as user data
    
    return AuthResponse(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      role: json['role'],
      userId: json['_id'] ?? json['userId'],
      user: userData != null ? UserModel.fromJson(userData) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'role': role,
      '_id': userId,
      'user': user?.toJson(),
    };
  }
}
