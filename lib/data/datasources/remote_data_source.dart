// lib/data/datasources/remote_data_source.dart - Remote API data source
import 'package:dio/dio.dart';
import '../models/surah_model.dart';
import '../models/ayat_model.dart';
import '../models/tafsir_model.dart';
import '../../core/utils/constants.dart';
import '../../core/error/exception.dart';

abstract class RemoteDataSource {
  Future<List<SurahModel>> getAllSurah();
  Future<List<AyatModel>> getSurahDetail(int surahNumber);
  Future<List<TafsirModel>> getTafsirSurah(int surahNumber);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl({required this.dio});

  @override
  Future<List<SurahModel>> getAllSurah() async {
    try {
      final response = await dio.get('${Constants.baseUrl}${Constants.surahListEndpoint}');
      
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        return data.map((json) => SurahModel.fromJson(json)).toList();
      } else {
        throw ServerException('Failed to fetch surah list');
      }
    } catch (e) {
      if (e is DioException) {
        throw NetworkException('Network error: ${e.message}');
      }
      throw ServerException('Unexpected error: $e');
    }
  }

  @override
  Future<List<AyatModel>> getSurahDetail(int surahNumber) async {
    try {
      final response = await dio.get('${Constants.baseUrl}${Constants.surahDetailEndpoint}/$surahNumber');
      
      if (response.statusCode == 200) {
        final List<dynamic> ayatData = response.data['data']['ayat'];
        return ayatData.map((json) => AyatModel.fromJson(json, surahNumber)).toList();
      } else {
        throw ServerException('Failed to fetch surah detail');
      }
    } catch (e) {
      if (e is DioException) {
        throw NetworkException('Network error: ${e.message}');
      }
      throw ServerException('Unexpected error: $e');
    }
  }

  @override
  Future<List<TafsirModel>> getTafsirSurah(int surahNumber) async {
    try {
      final response = await dio.get('${Constants.baseUrl}${Constants.tafsirEndpoint}/$surahNumber');
      
      if (response.statusCode == 200) {
        final List<dynamic> tafsirData = response.data['data']['tafsir'];
        return tafsirData.map((json) => TafsirModel.fromJson(json)).toList();
      } else {
        throw ServerException('Failed to fetch tafsir');
      }
    } catch (e) {
      if (e is DioException) {
        throw NetworkException('Network error: ${e.message}');
      }
      throw ServerException('Unexpected error: $e');
    }
  }
}