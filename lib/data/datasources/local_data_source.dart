// lib/data/datasources/local_data_source.dart - Local Hive data source
import 'package:hive/hive.dart';
import '../models/surah_model.dart';
import '../models/ayat_model.dart';
import '../../core/utils/constants.dart';
import '../../core/error/exception.dart';

abstract class LocalDataSource {
  Future<List<SurahModel>> getCachedSurahList();
  Future<void> cacheSurahList(List<SurahModel> surahList);
  Future<List<AyatModel>> getCachedSurahDetail(int surahNumber);
  Future<void> cacheSurahDetail(int surahNumber, List<AyatModel> ayatList);
  Future<bool> isSurahCached(int surahNumber);
  Future<bool> isDataInitialized();
  Future<void> markDataAsInitialized();
  Future<Map<String, dynamic>> getSettings();
  Future<void> saveSettings(Map<String, dynamic> settings);
  Future<void> saveLastRead(int surahNumber, int ayatNumber);
  Future<Map<String, int>?> getLastRead();
  Future<void> addBookmark(int surahNumber, int ayatNumber, String surahName, String ayatText);
  Future<List<Map<String, dynamic>>> getBookmarks();
  Future<void> removeBookmark(int surahNumber, int ayatNumber);
}

class LocalDataSourceImpl implements LocalDataSource {
  final Box<SurahModel> surahBox;
  final Box<AyatModel> ayatBox;
  final Box settingsBox;
  final Box bookmarkBox;

  LocalDataSourceImpl({
    required this.surahBox,
    required this.ayatBox,
    required this.settingsBox,
    required this.bookmarkBox,
  });

  @override
  Future<List<SurahModel>> getCachedSurahList() async {
    try {
      if (surahBox.isEmpty) {
        throw CacheException('No cached surah data found');
      }
      return surahBox.values.toList();
    } catch (e) {
      throw CacheException('Failed to get cached surah list: $e');
    }
  }

  @override
  Future<void> cacheSurahList(List<SurahModel> surahList) async {
    try {
      await surahBox.clear();
      for (int i = 0; i < surahList.length; i++) {
        await surahBox.put(surahList[i].nomor, surahList[i]);
      }
    } catch (e) {
      throw CacheException('Failed to cache surah list: $e');
    }
  }

  @override
  Future<List<AyatModel>> getCachedSurahDetail(int surahNumber) async {
    try {
      final ayatList = ayatBox.values
          .where((ayat) => ayat.surahNumber == surahNumber)
          .toList();
      
      if (ayatList.isEmpty) {
        throw CacheException('No cached ayat data found for surah $surahNumber');
      }
      
      ayatList.sort((a, b) => a.nomorAyat.compareTo(b.nomorAyat));
      return ayatList;
    } catch (e) {
      throw CacheException('Failed to get cached surah detail: $e');
    }
  }

  @override
  Future<void> cacheSurahDetail(int surahNumber, List<AyatModel> ayatList) async {
    try {
      // Remove existing ayat for this surah
      final existingKeys = ayatBox.keys
          .where((key) => ayatBox.get(key)?.surahNumber == surahNumber)
          .toList();
      
      for (final key in existingKeys) {
        await ayatBox.delete(key);
      }

      // Add new ayat
      for (final ayat in ayatList) {
        final key = '${ayat.surahNumber}-${ayat.nomorAyat}';
        await ayatBox.put(key, ayat);
      }
    } catch (e) {
      throw CacheException('Failed to cache surah detail: $e');
    }
  }

  @override
  Future<bool> isSurahCached(int surahNumber) async {
    try {
      final ayatExists = ayatBox.values
          .any((ayat) => ayat.surahNumber == surahNumber);
      return ayatExists;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isDataInitialized() async {
    try {
      return settingsBox.get(Constants.isFirstTimeKey, defaultValue: true) == false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> markDataAsInitialized() async {
    try {
      await settingsBox.put(Constants.isFirstTimeKey, false);
    } catch (e) {
      throw CacheException('Failed to mark data as initialized: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> getSettings() async {
    try {
      return {
        Constants.isDarkModeKey: settingsBox.get(Constants.isDarkModeKey, defaultValue: false),
        Constants.arabicFontSizeKey: settingsBox.get(Constants.arabicFontSizeKey, defaultValue: Constants.defaultArabicFontSize),
        Constants.translationFontSizeKey: settingsBox.get(Constants.translationFontSizeKey, defaultValue: Constants.defaultTranslationFontSize),
        Constants.autoDownloadKey: settingsBox.get(Constants.autoDownloadKey, defaultValue: true),
      };
    } catch (e) {
      throw CacheException('Failed to get settings: $e');
    }
  }

  @override
  Future<void> saveSettings(Map<String, dynamic> settings) async {
    try {
      for (final entry in settings.entries) {
        await settingsBox.put(entry.key, entry.value);
      }
    } catch (e) {
      throw CacheException('Failed to save settings: $e');
    }
  }

  @override
  Future<void> saveLastRead(int surahNumber, int ayatNumber) async {
    try {
      await settingsBox.put(Constants.lastReadSurahKey, surahNumber);
      await settingsBox.put(Constants.lastReadAyatKey, ayatNumber);
    } catch (e) {
      throw CacheException('Failed to save last read: $e');
    }
  }

  @override
  Future<Map<String, int>?> getLastRead() async {
    try {
      final surahNumber = settingsBox.get(Constants.lastReadSurahKey);
      final ayatNumber = settingsBox.get(Constants.lastReadAyatKey);
      
      if (surahNumber != null && ayatNumber != null) {
        return {
          'surahNumber': surahNumber as int,
          'ayatNumber': ayatNumber as int,
        };
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> addBookmark(int surahNumber, int ayatNumber, String surahName, String ayatText) async {
    try {
      final key = '${surahNumber}-${ayatNumber}';
      final bookmark = {
        'surahNumber': surahNumber,
        'ayatNumber': ayatNumber,
        'surahName': surahName,
        'ayatText': ayatText,
        'createdAt': DateTime.now().toIso8601String(),
      };
      await bookmarkBox.put(key, bookmark);
    } catch (e) {
      throw CacheException('Failed to add bookmark: $e');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getBookmarks() async {
    try {
      return bookmarkBox.values.cast<Map<String, dynamic>>().toList();
    } catch (e) {
      throw CacheException('Failed to get bookmarks: $e');
    }
  }

  @override
  Future<void> removeBookmark(int surahNumber, int ayatNumber) async {
    try {
      final key = '${surahNumber}-${ayatNumber}';
      await bookmarkBox.delete(key);
    } catch (e) {
      throw CacheException('Failed to remove bookmark: $e');
    }
  }
}