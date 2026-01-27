# API Usage Guide

This document describes all available API functions in the Flutter app, organized by service.

## API Endpoints Class

All API endpoints are centralized in `lib/utils/api_endpoints.dart`:

```dart
import 'package:ej_flutter/utils/api_endpoints.dart';

// Auth endpoints
ApiEndpoints.register
ApiEndpoints.login
ApiEndpoints.verifyEmail
ApiEndpoints.forgetPassword
ApiEndpoints.resetPassword
ApiEndpoints.changePassword
ApiEndpoints.refreshToken
ApiEndpoints.logout

// User endpoints
ApiEndpoints.getUsers
ApiEndpoints.getProfile
ApiEndpoints.updateProfile
ApiEndpoints.updateUserPassword
ApiEndpoints.getUserDetails(id)
ApiEndpoints.updateUserStatus(id)
ApiEndpoints.deleteUser(id)
```

## AuthService

Located in `lib/services/auth_service.dart`

### 1. Register User
```dart
final authService = AuthService();
final response = await authService.register(
  name: 'John Doe',
  email: 'john@example.com',
  password: 'password123',
  phone: '+1234567890', // Optional
  confirmPassword: 'password123', // Optional, defaults to password
);

if (response.success) {
  final user = response.data; // UserModel
  print('User registered: ${user?.name}');
}
```

### 2. Login
```dart
final response = await authService.login(
  email: 'john@example.com',
  password: 'password123',
);

if (response.success) {
  final user = response.data; // UserModel
  print('Logged in: ${user?.name}');
} else {
  // Check if OTP verification is required
  if (response.message?.contains('OTP') == true) {
    // Navigate to OTP verification screen
  }
}
```

### 3. Verify Email (OTP)
```dart
final response = await authService.verifyEmail(
  email: 'john@example.com',
  otp: '123456',
);

if (response.success) {
  print('Email verified successfully');
}
```

### 4. Forget Password
```dart
final response = await authService.forgetPassword(
  email: 'john@example.com',
);

if (response.success) {
  print('OTP sent to email');
}
```

### 5. Reset Password
```dart
final response = await authService.resetPassword(
  email: 'john@example.com',
  otp: '123456',
  password: 'newPassword123',
);

if (response.success) {
  print('Password reset successfully');
}
```

### 6. Change Password (Authenticated)
```dart
final response = await authService.changePassword(
  oldPassword: 'oldPassword123',
  newPassword: 'newPassword123',
);

if (response.success) {
  print('Password changed successfully');
}
```

### 7. Refresh Token
```dart
final response = await authService.refreshToken(
  refreshToken: 'your_refresh_token',
);

if (response.success) {
  final authData = response.data; // AuthResponse with new tokens
  // Tokens are automatically saved to storage
}
```

### 8. Logout
```dart
final response = await authService.logout();

if (response.success) {
  print('Logged out successfully');
  // Navigate to login screen
}
```

### 9. Check Authentication Status
```dart
final isAuthenticated = await authService.isAuthenticated();
if (isAuthenticated) {
  print('User is authenticated');
}
```

### 10. Get Current User
```dart
final response = await authService.getCurrentUser();

if (response.success) {
  final user = response.data; // UserModel
  print('Current user: ${user?.name}');
}
```

## UserService

Located in `lib/services/user_service.dart`

### 1. Get Profile
```dart
final userService = UserService();
final response = await userService.getProfile();

if (response.success) {
  final user = response.data; // UserModel
  print('Profile: ${user?.name}');
}
```

### 2. Get All Users (Admin Only)
```dart
final response = await userService.getUsers(
  page: 1,
  limit: 10,
  status: 'active', // Optional: 'active' or 'inactive'
);

if (response.success) {
  final usersData = response.data; // UsersResponse
  print('Total users: ${usersData.meta.total}');
  for (final user in usersData.users) {
    print('User: ${user.name}');
  }
}
```

### 3. Get User Details (Admin Only)
```dart
final response = await userService.getUserDetails('user_id');

if (response.success) {
  final user = response.data; // UserModel
  print('User details: ${user?.name}');
}
```

### 4. Update Profile
```dart
final response = await userService.updateProfile(
  name: 'John Doe',
  phone: '+1234567890',
  bio: 'Software Developer',
  gender: 'male',
  dob: '1990-01-01',
  height: '180cm',
  location: 'New York',
  country: 'USA',
  // ... other optional fields
);

if (response.success) {
  final updatedUser = response.data; // UserModel
  print('Profile updated: ${updatedUser?.name}');
}
```

### 5. Change Password
```dart
final response = await userService.changePassword(
  currentPassword: 'oldPassword123',
  newPassword: 'newPassword123',
  confirmPassword: 'newPassword123',
);

if (response.success) {
  print('Password changed successfully');
}
```

### 6. Update User Status (Admin Only)
```dart
final response = await userService.updateUserStatus(
  id: 'user_id',
  status: 'active', // or 'inactive'
);

if (response.success) {
  final user = response.data; // UserModel
  print('User status updated');
}
```

### 7. Delete User (Admin Only)
```dart
final response = await userService.deleteUser('user_id');

if (response.success) {
  print('User deleted successfully');
}
```

## Using Services with Riverpod

### Example: Auth Controller
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ej_flutter/services/auth_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

// In your widget
final authService = ref.read(authServiceProvider);
final response = await authService.login(
  email: email,
  password: password,
);
```

### Example: User Controller
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ej_flutter/services/user_service.dart';

final userServiceProvider = Provider<UserService>((ref) {
  return UserService();
});

// In your widget
final userService = ref.read(userServiceProvider);
final response = await userService.getProfile();
```

## Error Handling

All API functions return `ApiResponse<T>` which includes:
- `success`: Boolean indicating if the request was successful
- `message`: String message from the server
- `data`: The response data (type T)
- `error`: Error details if any

```dart
final response = await authService.login(
  email: email,
  password: password,
);

if (response.success) {
  // Handle success
  final user = response.data;
} else {
  // Handle error
  print('Error: ${response.message}');
  // Show error to user
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(response.message ?? 'Login failed')),
  );
}
```

## Configuration

Update the base URL in `lib/utils/app_constants.dart`:

```dart
static const String baseUrl = 'http://your-backend-url:5001';
```

Make sure your backend server is running and accessible at this URL.
