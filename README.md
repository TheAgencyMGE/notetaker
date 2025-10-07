# NoteTaker

A Flutter note-taking application with Firebase backend.

## Environment Setup

Before running the application, you need to set up your environment variables and Firebase configuration files:

### 1. Environment Variables

1. Copy the `.env.example` file to `.env`:
   ```bash
   cp .env.example .env
   ```

2. Edit the `.env` file and replace the placeholder values with your actual Firebase configuration values.

### 2. Firebase Configuration Files

1. **Android**: Copy your Firebase `google-services.json` file to `android/app/google-services.json`
   - You can use `android/app/google-services.json.example` as a template
   - Download your actual file from the Firebase Console

2. **iOS**: If you plan to build for iOS, add your `GoogleService-Info.plist` file to `ios/Runner/`

### 3. Security Note

**Important:** Never commit these files to version control:
- `.env` - Contains your environment variables
- `android/app/google-services.json` - Contains Android Firebase configuration
- `ios/Runner/GoogleService-Info.plist` - Contains iOS Firebase configuration

These files are already added to `.gitignore`.

## Getting Started

This project is a starting point for a Flutter application.

1. Ensure you have Flutter installed and configured
2. Set up your environment variables as described above
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the application

## Firebase Configuration

This app uses Firebase for:
- Authentication
- Cloud Firestore for data storage

All Firebase configuration is managed through environment variables for security.

## Development Resources

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
