# Flutter MVC Project Structure

This project follows the MVC (Model-View-Controller) architecture pattern with Flutter Riverpod for state management and GoRouter for navigation.

## Project Structure

```
ej_flutter/
├── assets/
│   ├── images/          # Image assets
│   └── icons/           # Icon assets
│
├── lib/
│   ├── controllers/     # Riverpod StateNotifiers (Business Logic)
│   │   ├── auth_controller.dart
│   │   └── theme_controller.dart
│   │
│   ├── models/          # Data Models
│   │   ├── user_model.dart
│   │   └── api_response.dart
│   │
│   ├── routes/          # Navigation Configuration
│   │   └── app_router.dart
│   │
│   ├── services/        # API & Data Services
│   │   ├── api_service.dart
│   │   ├── auth_service.dart
│   │   └── storage_service.dart
│   │
│   ├── utils/           # Utilities & Constants
│   │   ├── app_colors.dart
│   │   ├── app_constants.dart
│   │   ├── app_theme.dart
│   │   └── app_text_styles.dart
│   │
│   ├── views/           # UI Components
│   │   ├── screens/     # Full Screen Widgets
│   │   │   ├── splash_screen.dart
│   │   │   ├── login_screen.dart
│   │   │   ├── register_screen.dart
│   │   │   ├── home_screen.dart
│   │   │   └── profile_screen.dart
│   │   │
│   │   └── widgets/     # Reusable Widgets
│   │       ├── loading_widget.dart
│   │       └── error_widget.dart
│   │
│   └── main.dart        # App Entry Point
│
└── pubspec.yaml
```

## Architecture Overview

### MVC Pattern

- **Models** (`lib/models/`): Data structures and business entities
- **Views** (`lib/views/`): UI components (screens and widgets)
- **Controllers** (`lib/controllers/`): Business logic and state management using Riverpod

### Key Features

1. **State Management**: Flutter Riverpod 3.2.0
2. **Routing**: GoRouter for declarative routing
3. **Theme**: Light and dark theme support
4. **API Integration**: HTTP service with error handling
5. **Local Storage**: SharedPreferences for persistent data

## Dependencies

- `flutter_riverpod: ^3.2.0` - State management
- `go_router: ^14.2.0` - Navigation
- `http: ^1.2.0` - HTTP client
- `shared_preferences: ^2.2.2` - Local storage

## Getting Started

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Update `lib/utils/app_constants.dart` with your API base URL

3. Add your assets to `assets/images/` and `assets/icons/`

4. Run the app:
   ```bash
   flutter run
   ```

## Routes

- `/splash` - Splash screen
- `/login` - Login screen
- `/register` - Registration screen
- `/home` - Home screen (protected)
- `/profile` - Profile screen (protected)

## Usage Examples

### Adding a New Screen

1. Create screen in `lib/views/screens/`
2. Add route in `lib/routes/app_router.dart`
3. Create controller if needed in `lib/controllers/`

### Adding a New Model

1. Create model class in `lib/models/`
2. Add fromJson/toJson methods
3. Use in services and controllers

### Adding a New Service

1. Create service in `lib/services/`
2. Use ApiService for HTTP calls
3. Create controller to expose service via Riverpod
