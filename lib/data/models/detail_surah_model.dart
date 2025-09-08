// lib/data/models/detail_surah_model.dart
import '../../domain/entities/detail_surah.dart';
import 'surah_model.dart';
import 'ayat_model.dart';

class DetailSurahModel {
  final SurahModel surah;
  final List<AyatModel> ayat;

  const DetailSurahModel({
    required this.surah,
    required this.ayat,
  });

  factory DetailSurahModel.fromJson(Map<String, dynamic> json) {
    return DetailSurahModel(
      surah: SurahModel.fromJson(json['data']),
      ayat: (json['data']['ayat'] as List)
          .map((ayatJson) => AyatModel.fromJson(ayatJson, json['data']['nomor']))
          .toList(),
    );
  }

  DetailSurah toDomain() {
    return DetailSurah(
      surah: surah.toDomain(),
      ayat: ayat.map((model) => model.toDomain()).toList(),
    );
  }
}