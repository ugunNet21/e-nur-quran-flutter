// lib/data/models/ayat_model.dart - Ayat data model with Hive adapter
import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/ayat.dart';

part 'ayat_model.g.dart'; // Generated file

@HiveType(typeId: 1)
class AyatModel extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int nomorAyat;

  @HiveField(1)
  final String teksArab;

  @HiveField(2)
  final String teksLatin;

  @HiveField(3)
  final String teksIndonesia;

  @HiveField(4)
  final Map<String, String>? audio;

  @HiveField(5)
  final int surahNumber;

  AyatModel({
    required this.nomorAyat,
    required this.teksArab,
    required this.teksLatin,
    required this.teksIndonesia,
    this.audio,
    required this.surahNumber,
  });

  // Factory constructor from JSON
  factory AyatModel.fromJson(Map<String, dynamic> json, int surahNumber) {
    return AyatModel(
      nomorAyat: json['nomorAyat'] as int,
      teksArab: json['teksArab'] as String,
      teksLatin: json['teksLatin'] as String,
      teksIndonesia: json['teksIndonesia'] as String,
      audio: json['audio'] != null
          ? Map<String, String>.from(json['audio'])
          : null,
      surahNumber: surahNumber,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'nomorAyat': nomorAyat,
      'teksArab': teksArab,
      'teksLatin': teksLatin,
      'teksIndonesia': teksIndonesia,
      'audio': audio,
    };
  }

  // Convert to domain entity
  Ayat toDomain() {
    return Ayat(
      nomorAyat: nomorAyat,
      teksArab: teksArab,
      teksLatin: teksLatin,
      teksIndonesia: teksIndonesia,
      audio: audio,
    );
  }

  // Create from domain entity
  factory AyatModel.fromDomain(Ayat ayat, int surahNumber) {
    return AyatModel(
      nomorAyat: ayat.nomorAyat,
      teksArab: ayat.teksArab,
      teksLatin: ayat.teksLatin,
      teksIndonesia: ayat.teksIndonesia,
      audio: ayat.audio,
      surahNumber: surahNumber,
    );
  }

  @override
  List<Object?> get props => [
        nomorAyat,
        teksArab,
        teksLatin,
        teksIndonesia,
        audio,
        surahNumber,
      ];
}
