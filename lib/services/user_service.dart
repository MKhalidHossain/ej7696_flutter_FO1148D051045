// This file is kept for compatibility but all API calls have been removed
// Only design/UI code remains in the app

import '../models/user_model.dart';
import '../models/api_response.dart';
import '../models/users_response.dart';

class UserService {
  /// Get current user profile (design only - no API call)
  Future<ApiResponse<UserModel>> getProfile() async {
    // Mock response for design only
    await Future.delayed(const Duration(milliseconds: 500));
    return ApiResponse<UserModel>(
      success: false,
      message: 'Design mode - no API calls',
    );
  }

  /// Get all users (design only - no API call)
  Future<ApiResponse<UsersResponse>> getUsers({
    int page = 1,
    int limit = 10,
    String? status,
  }) async {
    // Mock response for design only
    await Future.delayed(const Duration(milliseconds: 500));
    return ApiResponse<UsersResponse>(
      success: false,
      message: 'Design mode - no API calls',
    );
  }

  /// Get user details by ID (design only - no API call)
  Future<ApiResponse<UserModel>> getUserDetails(String id) async {
    // Mock response for design only
    await Future.delayed(const Duration(milliseconds: 500));
    return ApiResponse<UserModel>(
      success: false,
      message: 'Design mode - no API calls',
    );
  }

  /// Update user profile (design only - no API call)
  Future<ApiResponse<UserModel>> updateProfile({
    String? name,
    String? phone,
    String? bio,
    String? gender,
    String? dob,
    String? height,
    String? sexualOrientation,
    String? personalityType,
    String? religion,
    dynamic lookingFor,
    dynamic interests,
    String? location,
    String? language,
    String? country,
    bool? notifications,
    dynamic addresses,
  }) async {
    // Mock response for design only
    await Future.delayed(const Duration(milliseconds: 500));
    return ApiResponse<UserModel>(
      success: false,
      message: 'Design mode - no API calls',
    );
  }

  /// Update profile with avatar file upload (design only - no API call)
  Future<ApiResponse<UserModel>> updateProfileWithFile({
    String? name,
    String? phone,
    String? bio,
    String? avatarPath,
  }) async {
    // Mock response for design only
    await Future.delayed(const Duration(milliseconds: 500));
    return ApiResponse<UserModel>(
      success: false,
      message: 'Design mode - no API calls',
    );
  }

  /// Change user password (design only - no API call)
  Future<ApiResponse<void>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    // Mock response for design only
    await Future.delayed(const Duration(milliseconds: 500));
    return ApiResponse<void>(
      success: false,
      message: 'Design mode - no API calls',
    );
  }

  /// Update user status (design only - no API call)
  Future<ApiResponse<UserModel>> updateUserStatus({
    required String id,
    required String status,
  }) async {
    // Mock response for design only
    await Future.delayed(const Duration(milliseconds: 500));
    return ApiResponse<UserModel>(
      success: false,
      message: 'Design mode - no API calls',
    );
  }

  /// Delete user (design only - no API call)
  Future<ApiResponse<void>> deleteUser(String id) async {
    // Mock response for design only
    await Future.delayed(const Duration(milliseconds: 500));
    return ApiResponse<void>(
      success: false,
      message: 'Design mode - no API calls',
    );
  }
}
