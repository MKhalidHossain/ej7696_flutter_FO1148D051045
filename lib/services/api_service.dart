import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/api_response.dart';
import '../models/auth_response.dart';
import '../models/otp_response.dart';
import '../utils/app_constants.dart';
import 'storage_service.dart';

class ApiService {
  final StorageService _storageService = StorageService();

  Future<Map<String, String>> _getHeaders() async {
    final token = await _storageService.getToken();
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  Future<ApiResponse<T>> get<T>(
    String endpoint, {
    Map<String, String>? queryParams,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final uri = Uri.parse('${AppConstants.baseUrl}$endpoint')
          .replace(queryParameters: queryParams);
      
      final response = await http
          .get(uri, headers: await _getHeaders())
          .timeout(AppConstants.apiTimeout);

      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return ApiResponse<T>(
        success: false,
        message: 'Network error: ${e.toString()}',
      );
    }
  }

  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    Map<String, dynamic>? body,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final uri = Uri.parse('${AppConstants.baseUrl}$endpoint');
      
      final response = await http
          .post(
            uri,
            headers: await _getHeaders(),
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(AppConstants.apiTimeout);

      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return ApiResponse<T>(
        success: false,
        message: 'Network error: ${e.toString()}',
      );
    }
  }

  Future<ApiResponse<T>> put<T>(
    String endpoint, {
    Map<String, dynamic>? body,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final uri = Uri.parse('${AppConstants.baseUrl}$endpoint');
      
      final response = await http
          .put(
            uri,
            headers: await _getHeaders(),
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(AppConstants.apiTimeout);

      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return ApiResponse<T>(
        success: false,
        message: 'Network error: ${e.toString()}',
      );
    }
  }

  Future<ApiResponse<T>> delete<T>(
    String endpoint, {
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final uri = Uri.parse('${AppConstants.baseUrl}$endpoint');
      
      final response = await http
          .delete(uri, headers: await _getHeaders())
          .timeout(AppConstants.apiTimeout);

      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return ApiResponse<T>(
        success: false,
        message: 'Network error: ${e.toString()}',
      );
    }
  }

  ApiResponse<T> _handleResponse<T>(
    http.Response response,
    T Function(dynamic)? fromJson,
  ) {
    try {
      final jsonData = jsonDecode(response.body);
      
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return ApiResponse<T>(
          success: true,
          message: jsonData['message'],
          data: jsonData['data'] != null && fromJson != null
              ? fromJson(jsonData['data'])
              : jsonData['data'] as T?,
        );
      } else {
        return ApiResponse<T>(
          success: false,
          message: jsonData['message'] ?? 'Request failed',
          error: jsonData['error'],
        );
      }
    } catch (e) {
      return ApiResponse<T>(
        success: false,
        message: 'Failed to parse response: ${e.toString()}',
      );
    }
  }

  // User Registration
  Future<ApiResponse<AuthResponse>> register({
    required String phone,
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final body = {
      'phone': phone,
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };

    final response = await post<AuthResponse>(
      '/auth/register',
      body: body,
      fromJson: (json) => AuthResponse.fromJson(json),
    );

    // Store tokens if registration is successful
    if (response.success && response.data != null) {
      if (response.data!.accessToken != null) {
        await _storageService.saveToken(response.data!.accessToken!);
      }
      if (response.data!.refreshToken != null) {
        await _storageService.saveRefreshToken(response.data!.refreshToken!);
      }
      if (response.data!.userId != null) {
        await _storageService.saveUserId(response.data!.userId!);
      }
    }

    return response;
  }

  // Forgot Password (Request OTP)
  Future<ApiResponse<OtpResponse>> forgotPassword({
    required String email,
  }) async {
    final body = {
      'email': email,
    };

    return await post<OtpResponse>(
      '/auth/forget',
      body: body,
      fromJson: (json) => OtpResponse.fromJson(json),
    );
  }

  // Verify OTP and Reset Password
  Future<ApiResponse<Map<String, dynamic>>> verifyOtp({
    required String email,
    required String otp,
    required String password,
  }) async {
    final body = {
      'email': email,
      'otp': otp,
      'password': password,
    };

    return await post<Map<String, dynamic>>(
      '/auth/reset-password',
      body: body,
      fromJson: (json) => json as Map<String, dynamic>,
    );
  }

  // User Login
  Future<ApiResponse<AuthResponse>> login({
    required String email,
    required String password,
  }) async {
    final body = {
      'email': email,
      'password': password,
    };

    final response = await post<AuthResponse>(
      '/auth/login',
      body: body,
      fromJson: (json) => AuthResponse.fromJson(json),
    );

    // Store tokens if login is successful
    if (response.success && response.data != null) {
      if (response.data!.accessToken != null) {
        await _storageService.saveToken(response.data!.accessToken!);
      }
      if (response.data!.refreshToken != null) {
        await _storageService.saveRefreshToken(response.data!.refreshToken!);
      }
      if (response.data!.userId != null) {
        await _storageService.saveUserId(response.data!.userId!);
      }
    }

    return response;
  }
}
