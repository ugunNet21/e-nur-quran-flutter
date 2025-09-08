# E-Nur Quran - Aplikasi Al-Quran Digital Indonesia

## Deskripsi
E-Nur Quran adalah aplikasi Al-Quran digital yang dapat bekerja secara offline. Aplikasi ini menyediakan fitur-fitur seperti:

- 📖 Baca Al-Quran dengan terjemahan Indonesia
- 🔍 Pencarian surah dan ayat
- 🔖 Bookmark ayat favorit
- 🕐 Jadwal shalat
- 🎵 Audio Al-Quran dari berbagai qari
- 🌙 Mode gelap dan terang
- 📱 Interface yang mirip dengan Quran Indonesia

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Runner
```bash
flutter run -t lib/main.dart

```
# Struktur

```bash
.
├── analysis_options.yaml
├── android
│   ├── app
│   │   ├── build.gradle
│   │   └── src
│   │       ├── debug
│   │       │   └── AndroidManifest.xml
│   │       ├── main
│   │       │   ├── AndroidManifest.xml
│   │       │   ├── java
│   │       │   │   └── io
│   │       │   │       └── flutter
│   │       │   │           └── plugins
│   │       │   │               └── GeneratedPluginRegistrant.java
│   │       │   ├── kotlin
│   │       │   │   └── com
│   │       │   │       └── example
│   │       │   │           └── e_nur_quran
│   │       │   │               └── MainActivity.kt
│   │       │   └── res
│   │       │       ├── drawable
│   │       │       │   └── launch_background.xml
│   │       │       ├── drawable-v21
│   │       │       │   └── launch_background.xml
│   │       │       ├── mipmap-hdpi
│   │       │       │   └── ic_launcher.png
│   │       │       ├── mipmap-mdpi
│   │       │       │   └── ic_launcher.png
│   │       │       ├── mipmap-xhdpi
│   │       │       │   └── ic_launcher.png
│   │       │       ├── mipmap-xxhdpi
│   │       │       │   └── ic_launcher.png
│   │       │       ├── mipmap-xxxhdpi
│   │       │       │   └── ic_launcher.png
│   │       │       ├── values
│   │       │       │   └── styles.xml
│   │       │       └── values-night
│   │       │           └── styles.xml
│   │       └── profile
│   │           └── AndroidManifest.xml
│   ├── build.gradle
│   ├── e_nur_quran_android.iml
│   ├── gradle
│   │   └── wrapper
│   │       ├── gradle-wrapper.jar
│   │       └── gradle-wrapper.properties
│   ├── gradle.properties
│   ├── gradlew
│   ├── gradlew.bat
│   ├── local.properties
│   └── settings.gradle
├── e_nur_quran.iml
├── ios
│   ├── Flutter
│   │   ├── AppFrameworkInfo.plist
│   │   ├── Debug.xcconfig
│   │   └── Release.xcconfig
│   ├── Runner
│   │   ├── AppDelegate.swift
│   │   ├── Assets.xcassets
│   │   │   ├── AppIcon.appiconset
│   │   │   │   ├── Contents.json
│   │   │   │   ├── Icon-App-1024x1024@1x.png
│   │   │   │   ├── Icon-App-20x20@1x.png
│   │   │   │   ├── Icon-App-20x20@2x.png
│   │   │   │   ├── Icon-App-20x20@3x.png
│   │   │   │   ├── Icon-App-29x29@1x.png
│   │   │   │   ├── Icon-App-29x29@2x.png
│   │   │   │   ├── Icon-App-29x29@3x.png
│   │   │   │   ├── Icon-App-40x40@1x.png
│   │   │   │   ├── Icon-App-40x40@2x.png
│   │   │   │   ├── Icon-App-40x40@3x.png
│   │   │   │   ├── Icon-App-60x60@2x.png
│   │   │   │   ├── Icon-App-60x60@3x.png
│   │   │   │   ├── Icon-App-76x76@1x.png
│   │   │   │   ├── Icon-App-76x76@2x.png
│   │   │   │   └── Icon-App-83.5x83.5@2x.png
│   │   │   └── LaunchImage.imageset
│   │   │       ├── Contents.json
│   │   │       ├── LaunchImage@2x.png
│   │   │       ├── LaunchImage@3x.png
│   │   │       ├── LaunchImage.png
│   │   │       └── README.md
│   │   ├── Base.lproj
│   │   │   ├── LaunchScreen.storyboard
│   │   │   └── Main.storyboard
│   │   ├── GeneratedPluginRegistrant.h
│   │   ├── GeneratedPluginRegistrant.m
│   │   ├── Info.plist
│   │   └── Runner-Bridging-Header.h
│   ├── RunnerTests
│   │   └── RunnerTests.swift
│   ├── Runner.xcodeproj
│   │   ├── project.pbxproj
│   │   ├── project.xcworkspace
│   │   │   ├── contents.xcworkspacedata
│   │   │   └── xcshareddata
│   │   │       ├── IDEWorkspaceChecks.plist
│   │   │       └── WorkspaceSettings.xcsettings
│   │   └── xcshareddata
│   │       └── xcschemes
│   │           └── Runner.xcscheme
│   └── Runner.xcworkspace
│       ├── contents.xcworkspacedata
│       └── xcshareddata
│           ├── IDEWorkspaceChecks.plist
│           └── WorkspaceSettings.xcsettings
├── lib
│   ├── core
│   │   ├── error
│   │   │   ├── exception.dart
│   │   │   └── failure.dart
│   │   ├── usecase
│   │   │   └── usecase.dart
│   │   └── utils
│   │       └── constants.dart
│   ├── data
│   │   ├── datasources
│   │   │   ├── local_data_source.dart
│   │   │   └── remote_data_source.dart
│   │   ├── models
│   │   │   ├── detail_surah_model.dart
│   │   │   ├── surah_model.dart
│   │   │   └── tafsir_model.dart
│   │   └── repositories
│   │       └── quran_repository_impl.dart
│   ├── domain
│   │   ├── entities
│   │   │   ├── detail_surah.dart
│   │   │   ├── surah.dart
│   │   │   └── tafsir.dart
│   │   ├── repositories
│   │   │   └── quran_repository.dart
│   │   └── usecases
│   │       ├── get_all_surah.dart
│   │       ├── get_detail_surah.dart
│   │       └── get_tafsir_surah.dart
│   ├── main.dart
│   └── presentation
│       ├── bloc
│       │   ├── surah_detail
│       │   │   ├── surah_detail_bloc.dart
│       │   │   ├── surah_detail_event.dart
│       │   │   └── surah_detail_state.dart
│       │   └── surah_list
│       │       ├── surah_list_bloc.dart
│       │       ├── surah_list_event.dart
│       │       └── surah_list_state.dart
│       ├── pages
│       │   ├── detail_surah_page.dart
│       │   └── home_page.dart
│       └── widgets
│           ├── ayat_list_item.dart
│           └── surah_list_item.dart
├── linux
│   ├── CMakeLists.txt
│   ├── flutter
│   │   ├── CMakeLists.txt
│   │   ├── generated_plugin_registrant.cc
│   │   ├── generated_plugin_registrant.h
│   │   └── generated_plugins.cmake
│   ├── main.cc
│   ├── my_application.cc
│   └── my_application.h
├── macos
│   ├── Flutter
│   │   ├── Flutter-Debug.xcconfig
│   │   ├── Flutter-Release.xcconfig
│   │   └── GeneratedPluginRegistrant.swift
│   ├── Runner
│   │   ├── AppDelegate.swift
│   │   ├── Assets.xcassets
│   │   │   └── AppIcon.appiconset
│   │   │       ├── app_icon_1024.png
│   │   │       ├── app_icon_128.png
│   │   │       ├── app_icon_16.png
│   │   │       ├── app_icon_256.png
│   │   │       ├── app_icon_32.png
│   │   │       ├── app_icon_512.png
│   │   │       ├── app_icon_64.png
│   │   │       └── Contents.json
│   │   ├── Base.lproj
│   │   │   └── MainMenu.xib
│   │   ├── Configs
│   │   │   ├── AppInfo.xcconfig
│   │   │   ├── Debug.xcconfig
│   │   │   ├── Release.xcconfig
│   │   │   └── Warnings.xcconfig
│   │   ├── DebugProfile.entitlements
│   │   ├── Info.plist
│   │   ├── MainFlutterWindow.swift
│   │   └── Release.entitlements
│   ├── RunnerTests
│   │   └── RunnerTests.swift
│   ├── Runner.xcodeproj
│   │   ├── project.pbxproj
│   │   ├── project.xcworkspace
│   │   │   └── xcshareddata
│   │   │       └── IDEWorkspaceChecks.plist
│   │   └── xcshareddata
│   │       └── xcschemes
│   │           └── Runner.xcscheme
│   └── Runner.xcworkspace
│       ├── contents.xcworkspacedata
│       └── xcshareddata
│           └── IDEWorkspaceChecks.plist
├── pubspec.lock
├── pubspec.yaml
├── README.md
├── shell
│   └── generate-enurquran.sh
├── test
│   └── widget_test.dart
├── web
│   ├── favicon.png
│   ├── icons
│   │   ├── Icon-192.png
│   │   ├── Icon-512.png
│   │   ├── Icon-maskable-192.png
│   │   └── Icon-maskable-512.png
│   ├── index.html
│   └── manifest.json
└── windows
    ├── CMakeLists.txt
    ├── flutter
    │   ├── CMakeLists.txt
    │   ├── generated_plugin_registrant.cc
    │   ├── generated_plugin_registrant.h
    │   └── generated_plugins.cmake
    └── runner
        ├── CMakeLists.txt
        ├── flutter_window.cpp
        ├── flutter_window.h
        ├── main.cpp
        ├── resource.h
        ├── resources
        │   └── app_icon.ico
        ├── runner.exe.manifest
        ├── Runner.rc
        ├── utils.cpp
        ├── utils.h
        ├── win32_window.cpp
        └── win32_window.h

86 directories, 158 files
```

## Setup dan Instalasi

### 1. Prerequisites
- Flutter SDK (>=3.0.0)
- Android Studio / VS Code
- Android SDK / Xcode (untuk iOS)

### 2. Clone dan Setup
```bash
git clone <repository-url>
cd e_nur_quran
flutter pub get
```

### 3. Generate Hive Adapters
```bash
flutter packages pub run build_runner build
```

### 4. Folder Structure
```
lib/
├── core/
│   ├── di/                 # Dependency Injection
│   ├── error/             # Error handling
│   ├── theme/             # App theming
│   ├── usecase/           # Base use case
│   └── utils/             # Constants & utilities
├── data/
│   ├── datasources/       # Local & Remote data sources
│   ├── models/            # Data models
│   └── repositories/      # Repository implementations
├── domain/
│   ├── entities/          # Business entities
│   ├── repositories/      # Repository interfaces
│   └── usecases/          # Business logic use cases
└── presentation/
    ├── bloc/              # State management
    ├── pages/             # UI screens
    └── widgets/           # Reusable components
```

### 5. Assets Setup
Buat folder berikut di root project:
```
assets/
├── animations/
│   ├── splash.json
│   ├── loading.json
│   └── no_internet.json
├── images/
│   ├── app_logo.png
│   └── islamic_pattern.png
└── fonts/
    ├── Amiri-Regular.ttf
    └── Amiri-Bold.ttf
```

### 6. Android Configuration
Di `android/app/src/main/AndroidManifest.xml`, tambahkan permissions:
```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

### 7. iOS Configuration (Optional)
Di `ios/Runner/Info.plist`, tambahkan:
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>Aplikasi ini memerlukan lokasi untuk menampilkan jadwal shalat yang akurat</string>
```

## Fitur Utama

### 1. Home Dashboard
- Greeting dan search bar
- Last read surah
- Prayer times widget
- Quick access menu
- Popular surahs

### 2. Surah List
- Daftar lengkap 114 surah
- Search functionality
- Makki/Madani indicators
- Ayat count dan arti

### 3. Surah Detail
- Arabic text dengan font Amiri
- Latin transliteration
- Indonesian translation
- Audio playback controls
- Bookmark functionality
- Share ayat

### 4. Offline Capability
- Automatic data caching dengan Hive
- Priority download untuk surah populer
- Offline-first architecture

## API Integration

### Base URL
```
https://equran.id/api/v2
```

### Endpoints:
- `GET /surat` - Daftar semua surah
- `GET /surat/{id}` - Detail surah dengan ayat
- `GET /tafsir/{id}` - Tafsir surah

### Response Example:
```json
{
  "code": 200,
  "message": "Data retrieved successfully",
  "data": {
    "nomor": 1,
    "nama": "الفاتحة",
    "namaLatin": "Al-Fatihah",
    "jumlahAyat": 7,
    "tempatTurun": "Mekah",
    "arti": "Pembukaan"
  }
}
```

## State Management

Aplikasi menggunakan **Flutter BLoC** untuk state management:

### BLoC Classes:
- `SurahListBloc` - Manages surah list state
- `SurahDetailBloc` - Manages individual surah state
- `PrayerTimeBloc` - Manages prayer times
- `QuranAudioBloc` - Manages audio playback

## Local Storage

### Hive Boxes:
- `surah_box` - Cached surah list
- `ayat_box` - Cached ayat data
- `settings_box` - App settings
- `bookmark_box` - User bookmarks

## Dependencies

### Core Dependencies:
```yaml
flutter_bloc: ^8.1.6        # State management
hive: ^2.2.3                # Local database
dio: ^5.7.0                 # HTTP client
connectivity_plus: ^6.0.5   # Network status
lottie: ^3.1.2              # Animations
```

### Audio & Media:
```yaml
just_audio: ^0.9.40         # Audio playback
```

### UI & Utilities:
```yaml
intl: ^0.19.0               # Internationalization
shared_preferences: ^2.3.2  # Simple storage
permission_handler: ^11.3.1 # Permissions
```

## Development Notes

### Clean Architecture
Aplikasi mengikuti prinsip Clean Architecture:
- **Presentation Layer**: UI components dan BLoC
- **Domain Layer**: Business logic dan entities
- **Data Layer**: Data sources dan repositories

### Error Handling
```dart
abstract class Failure {
  final String message;
  const Failure(this.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}
```

### Offline Strategy
1. **First Launch**: Download critical data (Al-Fatihah, popular surahs)
2. **Subsequent Usage**: Load from cache, sync when online
3. **Background Sync**: Update cached data when connected

## Customization

### Theme Colors
```dart
static const Color primaryGreen = Color(0xFF2E7D32);
static const Color lightGreen = Color(0xFF81C784);
static const Color goldAccent = Color(0xFFFFD700);
```

### Arabic Font
- **Font Family**: Amiri (included)
- **Default Size**: 24px untuk Arab, 16px untuk terjemahan
- **Line Height**: 1.8 untuk readability

## Performance Optimization

1. **Lazy Loading**: Load ayat on demand
2. **Image Caching**: Cache downloaded assets
3. **Memory Management**: Dispose controllers properly
4. **Network Optimization**: Batch API calls

## Future Enhancements

- [ ] Tafsir integration
- [ ] Multiple translation support
- [ ] Prayer time notifications
- [ ] Qibla direction
- [ ] Reading progress tracking
- [ ] Social sharing features
- [ ] Offline maps for Qibla

## Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.

---

**Developed with ❤️ for Indonesian Muslim community**