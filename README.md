# EJ Flutter App

A Flutter application built with MVC architecture, Flutter Riverpod for state management, and GoRouter for navigation.

## 🏗️ Architecture

This project follows the **MVC (Model-View-Controller)** pattern:

- **Models**: Data structures and business entities
- **Views**: UI components (screens and reusable widgets)
- **Controllers**: Business logic and state management using Riverpod

## 📦 Dependencies

- `flutter_riverpod: ^3.2.0` - State management
- `go_router: ^14.2.0` - Declarative routing
- `http: ^1.2.0` - HTTP client for API calls
- `shared_preferences: ^2.2.2` - Local storage

## 📁 Project Structure

```
lib/
├── controllers/        # Riverpod StateNotifiers
├── models/            # Data models
├── routes/            # GoRouter configuration
├── services/          # API & storage services
├── utils/             # Colors, constants, theme
└── views/             # Screens & widgets
```

## 🚀 Getting Started

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Configure API:**
   - Update `lib/utils/app_constants.dart` with your API base URL

3. **Add assets:**
   - Place images in `assets/images/`
   - Place icons in `assets/icons/`

4. **Run the app:**
   ```bash
   flutter run
   ```

## 🎨 Features

- ✅ MVC Architecture
- ✅ Riverpod State Management
- ✅ GoRouter Navigation
- ✅ Light/Dark Theme Support
- ✅ Authentication Flow
- ✅ API Integration
- ✅ Local Storage
- ✅ Error Handling
- ✅ Loading States

## 📱 Screens

- **Splash Screen** - Initial loading screen
- **Login Screen** - User authentication
- **Register Screen** - User registration
- **Home Screen** - Main dashboard (protected)
- **Profile Screen** - User profile (protected)

## 🔧 Configuration

### Update API Base URL

Edit `lib/utils/app_constants.dart`:
```dart
static const String baseUrl = 'https://your-api-url.com';
```

### Add Custom Colors

Edit `lib/utils/app_colors.dart` to customize your color scheme.

### Modify Theme

Edit `lib/utils/app_theme.dart` to customize light and dark themes.

## 📝 Usage

### Adding a New Screen

1. Create screen in `lib/views/screens/`
2. Add route in `lib/routes/app_router.dart`
3. Create controller if needed

### Adding a New Model

1. Create model class in `lib/models/`
2. Implement `fromJson` and `toJson` methods

### Using Controllers

```dart
// Watch state
final authState = ref.watch(authControllerProvider);

// Read controller
ref.read(authControllerProvider.notifier).login(email, password);
```

## 🎯 Next Steps

- Add more screens and features
- Integrate with your backend API
- Add custom assets
- Customize theme and colors
- Add more models and services
