// lib/core/utils/constants.dart - Application constants and configuration values
class Constants {
  // API Configuration
  static const String baseUrl = 'https://equran.id/api/v2';
  static const String surahListEndpoint = '/surat';
  static const String surahDetailEndpoint = '/surat';
  static const String tafsirEndpoint = '/tafsir';
  
  // Hive Box Names
  static const String surahBoxName = 'surah_box';
  static const String ayatBoxName = 'ayat_box';
  static const String settingsBoxName = 'settings_box';
  static const String bookmarkBoxName = 'bookmark_box';
  static const String lastReadBoxName = 'last_read_box';
  
  // Hive Keys
  static const String isFirstTimeKey = 'is_first_time';
  static const String isDarkModeKey = 'is_dark_mode';
  static const String arabicFontSizeKey = 'arabic_font_size';
  static const String translationFontSizeKey = 'translation_font_size';
  static const String lastReadSurahKey = 'last_read_surah';
  static const String lastReadAyatKey = 'last_read_ayat';
  static const String autoDownloadKey = 'auto_download';
  
  // Font Sizes
  static const double defaultArabicFontSize = 24.0;
  static const double defaultTranslationFontSize = 16.0;
  static const double minFontSize = 12.0;
  static const double maxFontSize = 32.0;
  
  // Prayer Time Cities (Indonesian major cities)
  static const List<Map<String, dynamic>> indonesianCities = [
    {'name': 'Jakarta', 'latitude': -6.2088, 'longitude': 106.8456},
    {'name': 'Surabaya', 'latitude': -7.2575, 'longitude': 112.7521},
    {'name': 'Bandung', 'latitude': -6.9175, 'longitude': 107.6191},
    {'name': 'Medan', 'latitude': 3.5952, 'longitude': 98.6722},
    {'name': 'Semarang', 'latitude': -6.9667, 'longitude': 110.4167},
    {'name': 'Yogyakarta', 'latitude': -7.7956, 'longitude': 110.3695},
    {'name': 'Makassar', 'latitude': -5.1477, 'longitude': 119.4327},
    {'name': 'Palembang', 'latitude': -2.9761, 'longitude': 104.7754},
  ];
  
  // Audio Settings
  static const List<String> availableQaris = [
    'Abdullah Al-Juhany',
    'Abdul Muhsin Al-Qasim',
    'Abdurrahman As-Sudais',
    'Ibrahim Al-Dossari',
    'Misyari Rasyid Al-Afasi',
  ];
  
  // Animation Assets
  static const String splashAnimation = 'assets/animations/splash.json';
  static const String loadingAnimation = 'assets/animations/loading.json';
  static const String noInternetAnimation = 'assets/animations/no_internet.json';
  static const String emptyAnimation = 'assets/animations/empty.json';
  
  // Image Assets
  static const String appLogo = 'assets/images/app_logo.png';
  static const String islamicPattern = 'assets/images/islamic_pattern.png';
  static const String kaabaBg = 'assets/images/kaaba_bg.jpg';
  
  // Colors (Hex values)
  static const int primaryColorValue = 0xFF2E7D32; // Green
  static const int secondaryColorValue = 0xFF81C784; // Light Green
  static const int accentColorValue = 0xFFFFD700; // Gold
  
  // Prayer Names
  static const List<String> prayerNames = [
    'Fajr',
    'Sunrise',
    'Dhuhr',
    'Asr',
    'Maghrib',
    'Isha',
  ];
  
  // Surah Categories
  static const List<String> makkiSurahs = [
    '1', '6', '7', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19',
    '20', '21', '23', '25', '26', '27', '28', '29', '30', '31', '32', '34',
    '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46',
    '50', '51', '52', '53', '54', '55', '56', '67', '68', '69', '70', '71',
    '72', '73', '74', '75', '76', '77', '78', '79', '80', '81', '82', '83',
    '84', '85', '86', '87', '88', '89', '90', '91', '92', '93', '94', '95',
    '96', '97', '100', '101', '102', '103', '104', '105', '106', '107',
    '108', '109', '111', '112', '113', '114'
  ];
}

// Extensions for convenience
extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

extension IntExtension on int {
  String toArabicNumber() {
    const arabicNumbers = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
    };
    
    return toString().split('').map((digit) => arabicNumbers[digit] ?? digit).join('');
  }
}